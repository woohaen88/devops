resource "aws_launch_template" "my-aws_launch_template" {
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      delete_on_termination = "true"
      iops                  = "0"
      # throughput            = "0"
      volume_size           = "20"
      volume_type           = "gp2"
    }
  }

  default_version         = "1"
  disable_api_termination = "false"

  iam_instance_profile {
    name = aws_iam_instance_profile.my-aws-iam-instance-profile.name
  }

  image_id      = "ami-085b4285663443932"
  instance_type = "t3a.medium"

  metadata_options {
    http_endpoint = "enabled"
    http_put_response_hop_limit = "2"
  }

  name = aws_iam_instance_profile.my-aws-iam-instance-profile.name

  network_interfaces {
    device_index       = "0"
    ipv4_address_count = "0"
    ipv6_address_count = "0"
    network_card_index = "0"
    security_groups    = [aws_security_group.test-sg-eks-cluster.id]
  }

  tags = {
    "eks:cluster-name"   = var.cluster-name
    "eks:nodegroup-name" = var.node-name
  }

  tags_all = {
    "eks:cluster-name"   = var.cluster-name
    "eks:nodegroup-name" = var.node-name
  }

  user_data = "TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiBtdWx0aXBhcnQvbWl4ZWQ7IGJvdW5kYXJ5PSIvLyIKCi0tLy8KQ29udGVudC1UeXBlOiB0ZXh0L3gtc2hlbGxzY3JpcHQ7IGNoYXJzZXQ9InVzLWFzY2lpIgojIS9iaW4vYmFzaApzZXQgLWV4CkI2NF9DTFVTVEVSX0NBPUxTMHRMUzFDUlVkSlRpQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENrMUpTVU12YWtORFFXVmhaMEYzU1VKQlowbENRVVJCVGtKbmEzRm9hMmxIT1hjd1FrRlJjMFpCUkVGV1RWSk5kMFZSV1VSV1VWRkVSWGR3Y21SWFNtd0tZMjAxYkdSSFZucE5RalJZUkZSSmVrMUVZM2ROZWtFMFRWUlJNVTlHYjFoRVZFMTZUVVJaZWsxRVFUUk5WRkV4VDBadmQwWlVSVlJOUWtWSFFURlZSUXBCZUUxTFlUTldhVnBZU25WYVdGSnNZM3BEUTBGVFNYZEVVVmxLUzI5YVNXaDJZMDVCVVVWQ1FsRkJSR2RuUlZCQlJFTkRRVkZ2UTJkblJVSkJUWFJLQ2tKNmFYQjFOSFZ2UWtWTlFVbEZWM1VyVlVwQlYydHVhVWRPZGtaQ1YwWllUbkJzYWxwTk1qTndaQzl4TW5GUmFqaGhXV3BRVURWYUsxUmlLMlE1YlcwS1VXTTNNM0JyWldaWlVEWXhabGRyY3poQmRuRkJTbU53Y1dWU2FYWkljMmxWTUdWVU0yaHlNWGRXWVVsaFowcEVkRlk0TjIxcllYY3liV3R6YjNwc2JBcFZZMDV6Um1aTWJHZEhUMmsxWjNKQ0wxUjJZVEJTUkc1d04wMXllVzVXYUU1c2QzYzFWbWxoUzBveU0zcGljRWx6V2pJemFraEhObGRFWkdkbGMweERDbG8wY1VreWVGSXJWemR1V0haSlREaHRka1JpVUVKSVRuQmhkV2hYWTNveU1HUkNlblJqVVV3eFFraFhjek53Y1VWT1pERlViWGt4TUhSQ0t6ZExTa0VLTVdFeFpXdzRjblV2ZWtGdmRscHZhRkJxUWpNeE9VUm1SaXRKVUdocWIwRnZPRkJyT1ROV2JISjZPSEV3VkhSblVIUkNkRUZWTW0xaVJrWTVSV05zVkFwM09FVnFLeTlNVlVVMmRqWjZXblF5ZFdaVlEwRjNSVUZCWVU1YVRVWmpkMFJuV1VSV1VqQlFRVkZJTDBKQlVVUkJaMHRyVFVFNFIwRXhWV1JGZDBWQ0NpOTNVVVpOUVUxQ1FXWTRkMGhSV1VSV1VqQlBRa0paUlVaQ1NqQXliM3BKTlVjNVMwUmtaSGxaVjJsV1p6TnpPVU1yU2tOTlFsVkhRVEZWWkVWUlVVOEtUVUY1UTBOdGRERlpiVlo1WW0xV01GcFlUWGRFVVZsS1MyOWFTV2gyWTA1QlVVVk1RbEZCUkdkblJVSkJTalpPVmxkUU5VMVZSV3RuYUVaT01qTnpUd3BQZUhGNVFtcGFRVXBRZUhCcE5XcERia1UwZURsME5GRjFiazk2TlcxT1UyeHhZbkZTWlVKVGQwcHNWelp3SzFSalVuUjBhbVZNTDFad1JHaEZkVFpXQ2pjNWFVaFpLMnB5VVc1emJIbGhUazVSUjFweU5HcERNa3hvT1M5aVEzRk1iSHBRWkRCVk5XbFVaVmxNT0RGTVRIWk1PSEZ5Um0wNFNGY3piRFE0WW1zS1YxVnZSbXhvUW1aaFJVZG1MMjE1TkZoRlJtcG9VRlZ5UVdkNVpFbzBSbm8wYldzd05sRkdkMkZNUTNkNlJGSnRTQ3RyU1N0bVowWjVjMUZLWTBOV2NBcEpjelZGUWs1MVYySkZaVE0zZWpad1ltWnBSamh3WkhnM1VrUk5hMllyVTJkelpYVndSMmsyWVRGTFRsWnJVazFKUlc1SlVtVk5aMVJpY0ROSWFqUjZDbUZyT0RGRmVsVjVRMVVyVDJ0eFR6ZzBXak5VZFVvelpVMVRRM2dyWmtoRFNGSlVVRlZZZFhkaU1UUXlXRTVGU1hSSE9FaHRaV2xXYm5RNFJFczVZVmdLYnpCVlBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0KQVBJX1NFUlZFUl9VUkw9aHR0cHM6Ly81MEY5QkIwRTVBMkY3QURERDc5QjkyMUQ2NkEzRUJDMi5zazEuYXAtbm9ydGhlYXN0LTIuZWtzLmFtYXpvbmF3cy5jb20KSzhTX0NMVVNURVJfRE5TX0lQPTEwLjEwMC4wLjEwCi9ldGMvZWtzL2Jvb3RzdHJhcC5zaCB0ZXN0LWVrcy1jbHVzdGVyIC0ta3ViZWxldC1leHRyYS1hcmdzICctLW5vZGUtbGFiZWxzPWVrcy5hbWF6b25hd3MuY29tL25vZGVncm91cC1pbWFnZT1hbWktMDg1YjQyODU2NjM0NDM5MzIsZWtzLmFtYXpvbmF3cy5jb20vY2FwYWNpdHlUeXBlPU9OX0RFTUFORCxla3MuYW1hem9uYXdzLmNvbS9ub2RlZ3JvdXA9dGVzdC1la3Mtbm9kZWdyb3VwLHJvbGU9ZWtzLW5vZGVncm91cCAtLW1heC1wb2RzPTE3JyAtLWI2NC1jbHVzdGVyLWNhICRCNjRfQ0xVU1RFUl9DQSAtLWFwaXNlcnZlci1lbmRwb2ludCAkQVBJX1NFUlZFUl9VUkwgLS1kbnMtY2x1c3Rlci1pcCAkSzhTX0NMVVNURVJfRE5TX0lQIC0tdXNlLW1heC1wb2RzIGZhbHNlCgotLS8vLS0="
}

resource "aws_launch_template" "test-launch-template" {
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      delete_on_termination = "true"
      iops                  = "0"
      volume_size           = "20"
      volume_type           = "gp2"
    }
  }

  default_version         = "1"
  disable_api_termination = "false"
  

  metadata_options {
    http_endpoint = "enabled"
    http_put_response_hop_limit = "2"
  }

  name = "${aws_iam_instance_profile.my-aws-iam-instance-profile.name}-2"

  network_interfaces {
    device_index       = "0"
    ipv4_address_count = "0"
    ipv6_address_count = "0"
    network_card_index = "0"
    security_groups    = [aws_security_group.test-sg-eks-cluster.id]
  }

  tags = {
    "eks:cluster-name"   = var.cluster-name
    "eks:nodegroup-name" = var.node-name
  }

  tags_all = {
    "eks:cluster-name"   = var.cluster-name
    "eks:nodegroup-name" = var.node-name
  }

  user_data = "TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiBtdWx0aXBhcnQvbWl4ZWQ7IGJvdW5kYXJ5PSIvLyIKCi0tLy8KQ29udGVudC1UeXBlOiB0ZXh0L3gtc2hlbGxzY3JpcHQ7IGNoYXJzZXQ9InVzLWFzY2lpIgojIS9iaW4vYmFzaApzZXQgLWV4CkI2NF9DTFVTVEVSX0NBPUxTMHRMUzFDUlVkSlRpQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENrMUpTVU12YWtORFFXVmhaMEYzU1VKQlowbENRVVJCVGtKbmEzRm9hMmxIT1hjd1FrRlJjMFpCUkVGV1RWSk5kMFZSV1VSV1VWRkVSWGR3Y21SWFNtd0tZMjAxYkdSSFZucE5RalJZUkZSSmVrMUVXWGxQVkVGNFRsUlplazVzYjFoRVZFMTZUVVJaZVU1cVFYaE9WRmw2VG14dmQwWlVSVlJOUWtWSFFURlZSUXBCZUUxTFlUTldhVnBZU25WYVdGSnNZM3BEUTBGVFNYZEVVVmxLUzI5YVNXaDJZMDVCVVVWQ1FsRkJSR2RuUlZCQlJFTkRRVkZ2UTJkblJVSkJTbGw1Q21WMFNrRTRVV2x2WlU1dGMzUlVTbkUwWlc5bWJ6ZDFlRU16YzNnd2JEaHpVRXRTYUZwcVpEbHNhVzh3U0dveVRFUklRVVptVldaTlZFMUJhREptSzNBS1JWaHlUV2czT0VVMGQxZHJjVGxZYWtGWmVrWmlPVlZNZDJGU1RUTkJjR0ZvYjBoQmVUTkdOSFphVTJvdldtUXdUVFZxVW5SdE1VUnNTMlJIUmpacVVncFRRM2RqWm5oeFluRkxOWEl3TlZoalEzVnJWMVJyZHpJMk1tRm1XaTlJUTNSbGFsbERUSHBtY0dsa1VXdHhOakpUYlRCMFVtRnlhRXRaYVZGbU1YaEpDbEZrVkU1NlpYWm1SWFp3WVZSSmQxUkhPR0U0TWxWdE5uZFRjMGgxWjFKQ1ZHRk5iV3RIZDFsQ2NVc3hSM0ZNUm5neE1VZEJSamRDTjAwM2RGRk1Va1lLVFV4YWNUTlhXV3BNYlVJdmRrNXBRMk13U1hBNE5GbFhaVUZHZG01a1MzbzNUMEU0ZW1kTmFHWnhTR0ZTUVZsc1ZsQnpZa3RrV2pCWlFWZG9XVVl6UndwbGRteFRaRzFJVVVjMVRtVmxXVnBaZFRKclEwRjNSVUZCWVU1YVRVWmpkMFJuV1VSV1VqQlFRVkZJTDBKQlVVUkJaMHRyVFVFNFIwRXhWV1JGZDBWQ0NpOTNVVVpOUVUxQ1FXWTRkMGhSV1VSV1VqQlBRa0paUlVaQk9HRkdhamc0ZUhKQ1lXNUJjRkZoTTJaNmRVcFNOekJRVlV4TlFsVkhRVEZWWkVWUlVVOEtUVUY1UTBOdGRERlpiVlo1WW0xV01GcFlUWGRFVVZsS1MyOWFTV2gyWTA1QlVVVk1RbEZCUkdkblJVSkJTVWhSUzJVM1YyVlJZM1ZuVXpjNVdIaDNXUXBrZWpGdmMyNTRiR1Z0VG5GTmVWRlZSbE54Wm1NdksxcFBlRU0xTUVwblNVZElWRmRPWmxneU1WUkNTRlpEU0hCeGQweGtXa3RvWVhSaWMwb3hPVnBXQ2psMVlXOXpOMjVNYjFaaFRUbFVPV0p3UmpsTFNETlBVSEkxUWs1V1pUUk5XRVJ1TURBNGNUbFdVRmRGVVVSeFpsWmljRE5XWVhWaFVVaERSRVJGVVRJS1NXcENRUzk0YlZGMmEyWXhka3BMWVZGeVZHWk5RbFpLZFZOS05XTmFOVkIzZFdoSWNuQldSRkIwYVV3M2Nra3hPRUl3VGxSR1NHcHNTRlZWZVdwVE1BcE9RVU51V0dWaGVVbHNOSEZaYkdWQ09EaGpLekJYYm1wU1ExbFhNV05FSzBZclEzbHBLMmgwYUVrMFpqWmliVXR6YW5GclNUZElSbmxSYTJ4dWFYWTRDbmcyVDNVNFltOUpaeTh6UkU5T1FVMUhVMUJ5YVRsWWIyODBkRXRqTXpKSmRUVXdVWHBUY1RRME0ybDJSVXhxV1ZVMGMyeHVNSFpzZUZadmVFSTVZVThLWlc1TlBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0KQVBJX1NFUlZFUl9VUkw9aHR0cHM6Ly9CMkZDMTEyRjJCODQ5NzI1NTAxMUYxNERGNTI0QTE0Ni55bDQuYXAtbm9ydGhlYXN0LTIuZWtzLmFtYXpvbmF3cy5jb20KSzhTX0NMVVNURVJfRE5TX0lQPTEwLjEwMC4wLjEwCi9ldGMvZWtzL2Jvb3RzdHJhcC5zaCB0ZXN0LWVrcy1jbHVzdGVyIC0ta3ViZWxldC1leHRyYS1hcmdzICctLW5vZGUtbGFiZWxzPWVrcy5hbWF6b25hd3MuY29tL25vZGVncm91cC1pbWFnZT1hbWktMDg1YjQyODU2NjM0NDM5MzIsZWtzLmFtYXpvbmF3cy5jb20vY2FwYWNpdHlUeXBlPU9OX0RFTUFORCxla3MuYW1hem9uYXdzLmNvbS9ub2RlZ3JvdXA9dGVzdC1la3Mtbm9kZWdyb3VwLHJvbGU9ZWtzLW5vZGVncm91cCAtLW1heC1wb2RzPTE3JyAtLWI2NC1jbHVzdGVyLWNhICRCNjRfQ0xVU1RFUl9DQSAtLWFwaXNlcnZlci1lbmRwb2ludCAkQVBJX1NFUlZFUl9VUkwgLS1kbnMtY2x1c3Rlci1pcCAkSzhTX0NMVVNURVJfRE5TX0lQIC0tdXNlLW1heC1wb2RzIGZhbHNlCgotLS8vLS0="
}
