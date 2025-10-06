# frozen_string_literal: true

require 'fileutils'

# Dotfiles management tasks
namespace :dotfiles do
  desc 'Setup nvim configuration by symlinking to ~/.config/nvim'
  task :setup_nvim do
    source_path = File.expand_path('editor/nvim', __dir__)
    target_path = File.expand_path('~/.config/nvim')
    config_dir = File.dirname(target_path)

    puts 'Setting up Neovim configuration...'
    puts "Source: #{source_path}"
    puts "Target: #{target_path}"

    # Create ~/.config directory if it doesn't exist
    unless Dir.exist?(config_dir)
      puts 'Creating ~/.config directory...'
      FileUtils.mkdir_p(config_dir)

    # Check if target already exists
    if File.exist?(target_path) || File.symlink?(target_path)
      if File.symlink?(target_path)
        current_target = File.readlink(target_path)
        if current_target == source_path
          puts '✓ Symlink already exists and points to the correct location'
          next
        else
          puts "⚠ Symlink exists but points to: #{current_target}"
          print 'Replace it? (y/N): '
          response = $stdin.gets.chomp.downcase
          unless ['y', 'yes'].include?(response)
            puts 'Skipping nvim setup'
            next
          end
        end
      else
        puts '⚠ ~/.config/nvim already exists as a regular directory'
        print 'Backup and replace it? (y/N): '
        response = $stdin.gets.chomp.downcase
        unless ['y', 'yes'].include?(response)
          puts 'Skipping nvim setup'
          next
        end

        # Backup existing directory
        backup_path = "#{target_path}.backup.#{Time.now.to_i}"
        puts "Backing up existing file to: #{backup_path}"
        FileUtils.mv(target_path, backup_path)
      end

      # Remove existing symlink/directory
      FileUtils.rm_rf(target_path)
    end

    # Create the symlink
    puts 'Creating symlink...'
    FileUtils.ln_s(source_path, target_path)

    puts '✓ Neovim configuration successfully linked!'
    puts 'You can now use nvim with your custom configuration.'
  end

  desc 'Remove nvim symlink'
  task :remove_nvim do
    target_path = File.expand_path('~/.config/nvim')

    if File.symlink?(target_path)
      puts 'Removing nvim symlink...'
      FileUtils.rm(target_path)
      puts '✓ Symlink removed'
    elsif File.exist?(target_path)
      puts '⚠ ~/.config/nvim exists but is not a symlink'
      puts 'Manual intervention required'
    else
      puts 'No nvim configuration found at ~/.config/nvim'
    end
  end

  desc 'Check nvim configuration status'
  task :check_nvim do
    source_path = File.expand_path('editor/nvim', __dir__)
    target_path = File.expand_path('~/.config/nvim')

    puts 'Neovim Configuration Status:'
    puts "Source: #{source_path}"
    puts "Target: #{target_path}"

    if File.exist?(source_path)
      puts '✓ Source directory exists'
    else
      puts '✗ Source directory missing'
    end

    if File.symlink?(target_path)
      linked_path = File.readlink(target_path)
      if linked_path == source_path
        puts '✓ Correctly symlinked'
      else
        puts "⚠ Symlinked to different location: #{linked_path}"
      end
    elsif File.exist?(target_path)
      puts '⚠ Target exists but is not a symlink'
    else
      puts '✗ No configuration found'
    end
    puts
  end

  desc 'Setup all dotfiles (currently just nvim)'
  task setup_all: [:setup_nvim] do
    puts '✓ All dotfiles setup complete!'
  end
end

# Default task
task :default do
  puts 'Available tasks:'
  puts '  rake dotfiles:setup_nvim   - Setup nvim configuration'
  puts '  rake dotfiles:remove_nvim  - Remove nvim symlink'
  puts '  rake dotfiles:check_nvim   - Check nvim status'
  puts '  rake dotfiles:setup_all    - Setup all dotfiles'
end
