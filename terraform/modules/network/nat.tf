resource "aws_eip" "nat" {
  count  = length(var.availability_zones)
  domain = "vpc"

  tags = {
    Name        = "${var.environment}-nat-eip-${count.index}"
    Environment = var.environment
  }

  depends_on = [aws_internet_gateway.main]
}