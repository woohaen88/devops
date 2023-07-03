resource "aws_autoscaling_group" "my_aws_autoscaling_group" {
  # availability_zones        = ["ap-northeast-2a", "ap-northeast-2c"]
  capacity_rebalance        = "true"
  default_cooldown          = "300"
  desired_capacity          = "1"
  force_delete              = "false"
  health_check_grace_period = "15"
  health_check_type         = "EC2"
  max_instance_lifetime     = "0"
  max_size                  = "1"
  metrics_granularity       = "1Minute"
  min_size                  = "1"

  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy            = "prioritized"
      on_demand_base_capacity                  = "0"
      on_demand_percentage_above_base_capacity = "100"
      spot_allocation_strategy                 = "lowest-price"
      spot_instance_pools                      = "2"
    }

    launch_template {
      launch_template_specification {
        # launch_template_id   = "lt-058583f05469815fc"
        launch_template_id = aws_launch_template.my-aws_launch_template.id
        launch_template_name = aws_launch_template.my-aws_launch_template.name
        version              = "1"
      }

      override {
        instance_type = "t3a.medium"
      }
    }
  }

  # name                    = "eks-test-eks-nodegroup-96c48d6a-2c79-680d-3b82-35af453e0c84"
  name                    = "eks-test-eks-nodegroup-${aws_launch_template.my-aws_launch_template.name}"
  protect_from_scale_in   = "false"
  service_linked_role_arn = "arn:aws:iam::559636686223:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"

  tag {
    key                 = "eks:cluster-name"
    propagate_at_launch = "true"
    value               = var.cluster-name
  }

  tag {
    key                 = "eks:nodegroup-name"
    propagate_at_launch = "true"
    value               = var.node-name
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = "true"
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/test-eks-cluster"
    propagate_at_launch = "true"
    value               = "owned"
  }

  tag {
    key                 = "kubernetes.io/cluster/test-eks-cluster"
    propagate_at_launch = "true"
    value               = "owned"
  }

  termination_policies      = ["AllocationStrategy", "OldestInstance", "OldestLaunchTemplate"]
  vpc_zone_identifier       = [aws_subnet.public-subent-01.id, aws_subnet.public-subnet-02.id]
  wait_for_capacity_timeout = "10m"
}
