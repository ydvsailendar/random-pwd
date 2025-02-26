output "pwd" {
  value       = random_password.pwd.result
  description = "Random generated password"
  sensitive   = true
}
