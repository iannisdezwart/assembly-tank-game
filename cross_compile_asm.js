const fs = require('fs')
const platform = process.argv[2]

const FN_STR = '<%fn '
const CALL_STR = '<%call '
const JMP_STR = '<%jmp '
const REF_STR = '<%ref '
const LBL_STR = '<%lbl '
const GLBL_STR = '<%glbl '
const IFMACOS_STR = '<%ifmacos '
const IFLINUX_STR = '<%iflinux '

const MAC_OS_FN_MAP = new Map([
	[ 'sincos', '__sincos' ]
])

const platformifyFnName = (fnName) => {
	if (platform == 'Darwin' && MAC_OS_FN_MAP.has(fnName)) {
		return MAC_OS_FN_MAP.get(fnName)
	}

	return fnName
}

const FILE_LIST = [
	'shared/buffer.s',
	'shared/bullet.s',
	'shared/random.s',
	'shared/shared_ptr.s',
	'shared/socket_tools.s',
	'shared/timing.s',
	'shared/drop.s',
	'client/assets.s',
	'client/bullet.s',
]

const processFile = (filename) => {
	const file = fs.readFileSync(filename, 'utf-8')
	let out = ''
	let i = 0

	const peek = (str) => {
		return file.substr(i, str.length) == str
	}

	const platformifyLabel = (fnName) => {
		if (platform == 'Darwin') {
			return `.global _${ fnName }\n_${ fnName }:`
		}

		if (platform == 'Linux') {
			return `.global ${ fnName }\n${ fnName }:`
		}

		throw Error(`Unknown platform "${ platform }"`)
	}

	const platformifyCall = (fnName) => {
		fnName = platformifyFnName(fnName)

		if (platform == 'Darwin') {
			return `call _${ fnName }`
		}

		if (platform == 'Linux') {
			return `call ${ fnName }`
		}

		throw Error(`Unknown platform "${ platform }"`)
	}

	const platformifyJmp = (labelName) => {
		labelName = platformifyFnName(labelName)

		if (platform == 'Darwin') {
			return `jmp _${ labelName }`
		}

		if (platform == 'Linux') {
			return `jmp ${ labelName }`
		}

		throw Error(`Unknown platform "${ platform }"`)
	}

	const platformifyRef = (labelName) => {
		if (platform == 'Darwin') {
			return `_${ labelName }(%rip)`
		}

		if (platform == 'Linux') {
			return `${ labelName }`
		}

		throw Error(`Unknown platform "${ platform }"`)
	}

	const platformifyLbl = (labelName) => {
		if (platform == 'Darwin') {
			return `_${ labelName }:`
		}

		if (platform == 'Linux') {
			return `${ labelName }:`
		}

		throw Error(`Unknown platform "${ platform }"`)
	}

	while (i < file.length) {
		if (peek(FN_STR)) {
			const end = file.indexOf('>', i + FN_STR.length)
			const fnName = file.substring(i + FN_STR.length, end)

			out += platformifyLabel(fnName)
			i = end + 1

			continue
		}

		if (peek(CALL_STR)) {
			const end = file.indexOf('>', i + CALL_STR.length)
			const fnName = file.substring(i + CALL_STR.length, end)

			out += platformifyCall(fnName)
			i = end + 1

			continue
		}

		if (peek(JMP_STR)) {
			const end = file.indexOf('>', i + JMP_STR.length)
			const labelName = file.substring(i + JMP_STR.length, end)

			out += platformifyJmp(labelName)
			i = end + 1

			continue
		}

		if (peek(REF_STR)) {
			const end = file.indexOf('>', i + REF_STR.length)
			const labelName = file.substring(i + REF_STR.length, end)

			out += platformifyRef(labelName)
			i = end + 1

			continue
		}

		if (peek(LBL_STR)) {
			const end = file.indexOf('>', i + LBL_STR.length)
			const labelName = file.substring(i + LBL_STR.length, end)

			out += platformifyLbl(labelName)
			i = end + 1

			continue
		}

		if (peek(GLBL_STR)) {
			const end = file.indexOf('>', i + GLBL_STR.length)
			const labelName = file.substring(i + GLBL_STR.length, end)

			out += platformifyLabel(labelName)
			i = end + 1

			continue
		}

		if (peek(IFMACOS_STR)) {
			const end = file.indexOf('>', i + IFMACOS_STR.length)
			const str = file.substring(i + IFMACOS_STR.length, end)

			if (platform == 'Darwin') {
				out += str
			}

			i = end + 1

			continue
		}

		if (peek(IFLINUX_STR)) {
			const end = file.indexOf('>', i + IFLINUX_STR.length)
			const str = file.substring(i + IFLINUX_STR.length, end)

			if (platform == 'Linux') {
				out += str
			}

			i = end + 1

			continue
		}

		out += file[i]
		i++
	}

	return out
}

for (const filename of FILE_LIST) {
	const out = processFile(filename)
	const outFilename = filename.substring(0, filename.length - 2) + '.pp.s'

	fs.writeFileSync(outFilename, out)
}