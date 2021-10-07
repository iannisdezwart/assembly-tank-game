/**
 * @brief Reads 1 byte from a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 */
uint8_t
read_u8(char **ptr)
{
	uint8_t data = **ptr;
	*ptr += 1;
	return data;
}

/**
 * @brief Reads 2 bytes from a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 */
uint16_t
read_u16(char **ptr)
{
	uint16_t data = **ptr;
	*ptr += 2;
	return data;
}

/**
 * @brief Reads 4 bytes from a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 */
uint32_t
read_u32(char **ptr)
{
	uint32_t data = **ptr;
	*ptr += 4;
	return data;
}

/**
 * @brief Reads 8 bytes from a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 */
uint64_t
read_u64(char **ptr)
{
	uint64_t data = **ptr;
	*ptr += 8;
	return data;
}

/**
 * @brief Reads 4 bytes from a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 */
float
read_f32(char **ptr)
{
	float data = **ptr;
	*ptr += 4;
	return data;
}

/**
 * @brief Reads 8 bytes from a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 */
double
read_f64(char **ptr)
{
	double data = **ptr;
	*ptr += 8;
	return data;
}

/**
 * @brief Writes 1 byte to a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 * @param data The data to write.
 */
void
write_u8(char **ptr, uint8_t data)
{
	**ptr = data;
	*ptr += 1;
}

/**
 * @brief Writes 2 bytes to a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 * @param data The data to write.
 */
void
write_u16(char **ptr, uint16_t data)
{
	**ptr = data;
	*ptr += 2;
}

/**
 * @brief Writes 4 bytes to a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 * @param data The data to write.
 */
void
write_u32(char **ptr, uint32_t data)
{
	**ptr = data;
	*ptr += 4;
}

/**
 * @brief Writes 8 bytes to a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 * @param data The data to write.
 */
void
write_u64(char **ptr, uint64_t data)
{
	**ptr = data;
	*ptr += 8;
}

/**
 * @brief Writes 4 bytes to a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 * @param data The data to write.
 */
void
write_f32(char **ptr, float data)
{
	**ptr = data;
	ptr += 4;
}

/**
 * @brief Writes 8 bytes to a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 * @param data The data to write.
 */
void
write_f64(char **ptr, float data)
{
	**ptr = data;
	ptr += 8;
}