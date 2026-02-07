resource "aws_subnet" "private" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name        = "${var.environment}-private-${var.availability_zones[count.index]}"
    Environment = var.environment
    Type        = "private"
  }
}
```

**What this does:**
- Creates **private subnets** (one per availability zone)
- These are the "kitchen" areas - hidden from public

**Line by line:**
- `count = length(var.availability_zones)` = "Create as many subnets as I have AZs"
  - If you pass 2 AZs, this creates 2 subnets
  - If you pass 3 AZs, this creates 3 subnets
- `count.index` = Which number iteration (0, 1, 2...)
- `cidr_block = var.private_subnet_cidrs[count.index]` = Get the IP range for this subnet

**Example:**
```
Iteration 0: Create subnet in us-east-1a with CIDR 10.0.1.0/24
Iteration 1: Create subnet in us-east-1b with CIDR 10.0.2.0/24