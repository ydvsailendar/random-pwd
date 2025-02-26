variable "length" {
  type        = number
  default     = 16
  description = "The length of the string desired."
}

variable "special" {
  type        = bool
  default     = true
  description = "Include special characters in the result"
}

variable "override_special" {
  type        = string
  description = "Supply your own list of special characters to use for string generation. This overrides the default character list in the special argument."

  validation {
    condition     = !var.special
    error_message = "To use override special must be set to true"
  }

  validation {
    condition     = length(var.override_special) > 6
    error_message = "Override special must be greater then 6 special characters"
  }

  validation {
    condition     = can(regex("^[!@#\\$%\\^&*()_+={}\\[\\]:;\"'<>,.?\\/\\\\|-]+$", var.override_special))
    error_message = "Override special must contain only special characters."
  }
}
