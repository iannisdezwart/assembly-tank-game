/**
 * @brief Reads 1 byte from a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 */
extern uint8_t
read_u8(char **ptr);

/**
 * @brief Reads 2 bytes from a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 */
extern uint16_t
read_u16(char **ptr);

/**
 * @brief Reads 4 bytes from a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 */
extern uint32_t
read_u32(char **ptr);

/**
 * @brief Reads 8 bytes from a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 */
extern uint64_t
read_u64(char **ptr);

/**
 * @brief Reads 4 bytes from a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 */
extern float
read_f32(char **ptr);

/**
 * @brief Reads 8 bytes from a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 */
extern double
read_f64(char **ptr);

/**
 * @brief Writes 1 byte to a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 * @param data The data to write.
 */
extern void
write_u8(char **ptr, uint8_t data);

/**
 * @brief Writes 2 bytes to a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 * @param data The data to write.
 */
extern void
write_u16(char **ptr, uint16_t data);

/**
 * @brief Writes 4 bytes to a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 * @param data The data to write.
 */
extern void
write_u32(char **ptr, uint32_t data);

/**
 * @brief Writes 8 bytes to a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 * @param data The data to write.
 */
extern void
write_u64(char **ptr, uint64_t data);

/**
 * @brief Writes 4 bytes to a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 * @param data The data to write.
 */
extern void
write_f32(char **ptr, float data);

/**
 * @brief Writes 8 bytes to a buffer.
 * @param ptr A pointer to a pointer to the buffer.
 * @param data The data to write.
 */
extern void
write_f64(char **ptr, double data);