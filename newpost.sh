#!/bin/bash

echo "What type of blog post is this? (n for note, p for post, j for journal)"
read -n 1 post_type
echo ""

echo "What is the name of the file (without the .md extension)?"
read file_name

echo "Enter tags separated by commas:"
read tags

case $post_type in
  n)
      file_path="content/note/$(date +'%Y-%m-%d')-$file_name.md"
      hugo new "$file_path"
      cat > "$file_path" << EOF
---
title: "$file_name"
date: "$(date +"%Y-%m-%d")"
author: "Xiong Nao"
tags: [$tags]
categories:
    - note
---
EOF
      ;;
  p)
      file_path="content/post/$(date +'%Y-%m-%d')-$file_name.md"
      hugo new "$file_path" "post"
      cat > "$file_path" << EOF
---
title: "$file_name"
date: "$(date +"%Y-%m-%d")"
author: "Xiong Nao"
tags: [$tags]
categories:
    - post
---
EOF
      ;;
  j)
      file_path="content/journal/$(date +'%Y-%m-%d')-$file_name.md"
      hugo new "$file_path" "journal"
      cat > "$file_path" << EOF
---
title: "$file_name &"
date: "$(date +"%Y-%m-%d")"
author: "Xiong Nao"
tags: [$tags, log]
categories:
    - journal
---
EOF
      ;;
  *)
      echo "Unknown post categories, start again"
      exit 1
      ;;
esac

echo "Created new file at $file_path"