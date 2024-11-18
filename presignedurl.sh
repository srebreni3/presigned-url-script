#!/bin/bash

read -p "Enter the S3 URI of the object (e.g., s3://bucket-name/picture.jpg): " s3_url

if [[ -z "$s3_url" ]]; then
  echo "Error: S3 URL cannot be empty. Please try again."
  exit 1
fi

read -p "Enter the expiration time for the presigned URL (in seconds): " expires_in

if ! [[ "$expires_in" =~ ^[0-9]+$ ]]; then
  echo "Error: Expiration time must be a positive integer. Please try again."
  exit 1
fi

echo "Generating presigned URL..."
aws s3 presign "$s3_url" --expires-in "$expires_in"

