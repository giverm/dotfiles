# frozen_string_literal: true

require 'fileutils'

# Dotfiles management tasks
namespace :dotfiles do
  # Helper method to setup symlinks
  def setup_symlink(source_path, target_path, description)
    # Check if source exists
    unless File.exist?(source_path)
      puts "✗ Source file not found: #{source_path}"
      return
    end

    # Check if target already exists
    if File.exist?(target_path) || File.symlink?(target_path)
      if File.symlink?(target_path)
        current_target = File.readlink(target_path)
        if current_target == source_path
          puts '✓ Symlink already exists and points to the correct location'
          return
        else
          puts "⚠ Symlink exists but points to: #{current_target}"
          print 'Replace it? (y/N): '
          response = $stdin.gets.chomp.downcase
          unless ['y', 'yes'].include?(response)
            puts "Skipping #{description} setup"
            return
          end
        end
      else
        puts "⚠ #{target_path} already exists"
        print 'Backup and replace it? (y/N): '
        response = $stdin.gets.chomp.downcase
        unless ['y', 'yes'].include?(response)
          puts "Skipping #{description} setup"
          return
        end

        # Backup existing file
        backup_path = "#{target_path}.backup.#{Time.now.to_i}"
        puts "Backing up existing file to: #{backup_path}"
        FileUtils.mv(target_path, backup_path)
      end

      # Remove existing symlink/file
      FileUtils.rm_rf(target_path)
    end

    # Create the symlink
    puts 'Creating symlink...'
    FileUtils.ln_s(source_path, target_path)

    puts "✓ #{description.capitalize} successfully linked!"
  end

  # Helper method to remove symlinks
  def remove_symlink(target_path, description)
    if File.symlink?(target_path)
      puts "Removing #{description} symlink..."
      FileUtils.rm(target_path)
      puts '✓ Symlink removed'
    elsif File.exist?(target_path)
      puts "⚠ #{target_path} exists but is not a symlink"
      puts 'Manual intervention required'
    else
      puts "No #{description} found at #{target_path}"
    end
  end

  # Helper method to check configuration status
  def check_configuration_status(name, source_path, target_path)
    puts "#{name} Configuration Status:"
    puts "Source: #{source_path}"
    puts "Target: #{target_path}"

    if File.exist?(source_path)
      puts '✓ Source file exists'
    else
      puts '✗ Source file missing'
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
    end

    setup_symlink(source_path, target_path, 'neovim configuration')
    puts 'You can now use nvim with your custom configuration.' if File.symlink?(target_path)
  end

  desc 'Remove nvim symlink'
  task :remove_nvim do
    target_path = File.expand_path('~/.config/nvim')
    remove_symlink(target_path, 'neovim configuration')
  end

  desc 'Check nvim configuration status'
  task :check_nvim do
    source_path = File.expand_path('editor/nvim', __dir__)
    target_path = File.expand_path('~/.config/nvim')
    check_configuration_status('Neovim', source_path, target_path)
  end

  desc 'Setup zshrc by symlinking to ~/.zshrc'
  task :setup_zsh do
    source_path = File.expand_path('shell/zshrc', __dir__)
    target_path = File.expand_path('~/.zshrc')

    puts 'Setting up zsh configuration...'
    puts "Source: #{source_path}"
    puts "Target: #{target_path}"

    setup_symlink(source_path, target_path, 'zsh configuration')
  end

  desc 'Setup gitconfig by symlinking to ~/.gitconfig'
  task :setup_git do
    source_path = File.expand_path('git/gitconfig', __dir__)
    target_path = File.expand_path('~/.gitconfig')

    puts 'Setting up git configuration...'
    puts "Source: #{source_path}"
    puts "Target: #{target_path}"

    setup_symlink(source_path, target_path, 'git configuration')
  end

  desc 'Setup gitignore by symlinking to ~/.gitignore'
  task :setup_gitignore do
    source_path = File.expand_path('git/gitignore', __dir__)
    target_path = File.expand_path('~/.gitignore')

    puts 'Setting up global gitignore...'
    puts "Source: #{source_path}"
    puts "Target: #{target_path}"

    setup_symlink(source_path, target_path, 'global gitignore')
  end

  desc 'Remove zsh symlink'
  task :remove_zsh do
    target_path = File.expand_path('~/.zshrc')
    remove_symlink(target_path, 'zsh configuration')
  end

  desc 'Remove git symlink'
  task :remove_git do
    target_path = File.expand_path('~/.gitconfig')
    remove_symlink(target_path, 'git configuration')
  end

  desc 'Remove gitignore symlink'
  task :remove_gitignore do
    target_path = File.expand_path('~/.gitignore')
    remove_symlink(target_path, 'global gitignore')
  end

  desc 'Check zsh configuration status'
  task :check_zsh do
    source_path = File.expand_path('shell/zshrc', __dir__)
    target_path = File.expand_path('~/.zshrc')
    check_configuration_status('Zsh', source_path, target_path)
  end

  desc 'Check git configuration status'
  task :check_git do
    source_path = File.expand_path('git/gitconfig', __dir__)
    target_path = File.expand_path('~/.gitconfig')
    check_configuration_status('Git', source_path, target_path)
  end

  desc 'Check gitignore configuration status'
  task :check_gitignore do
    source_path = File.expand_path('git/gitignore', __dir__)
    target_path = File.expand_path('~/.gitignore')
    check_configuration_status('Global gitignore', source_path, target_path)
  end

  desc 'Check all dotfiles status'
  task check_all: [:check_nvim, :check_zsh, :check_git, :check_gitignore] do
    puts '\n✓ Status check complete!'
  end

  desc 'Remove all dotfile symlinks'
  task remove_all: [:remove_nvim, :remove_zsh, :remove_git, :remove_gitignore] do
    puts '\n✓ All dotfile symlinks removed!'
  end

  desc 'Setup all dotfiles'
  task setup_all: [:setup_nvim, :setup_zsh, :setup_git, :setup_gitignore] do
    puts '\n✓ All dotfiles setup complete!'
  end
end

# Default task
task :default do
  puts 'Available tasks:'
  puts '  Setup tasks:'
  puts '    rake dotfiles:setup_all        - Setup all dotfiles'
  puts '    rake dotfiles:setup_nvim       - Setup nvim configuration'
  puts '    rake dotfiles:setup_zsh        - Setup zsh configuration'
  puts '    rake dotfiles:setup_git        - Setup git configuration'
  puts '    rake dotfiles:setup_gitignore  - Setup global gitignore'
  puts ''
  puts '  Remove tasks:'
  puts '    rake dotfiles:remove_all       - Remove all dotfile symlinks'
  puts '    rake dotfiles:remove_nvim      - Remove nvim symlink'
  puts '    rake dotfiles:remove_zsh       - Remove zsh symlink'
  puts '    rake dotfiles:remove_git       - Remove git symlink'
  puts '    rake dotfiles:remove_gitignore - Remove gitignore symlink'
  puts ''
  puts '  Check tasks:'
  puts '    rake dotfiles:check_all        - Check all dotfiles status'
  puts '    rake dotfiles:check_nvim       - Check nvim status'
  puts '    rake dotfiles:check_zsh        - Check zsh status'
  puts '    rake dotfiles:check_git        - Check git status'
  puts '    rake dotfiles:check_gitignore  - Check gitignore status'
end
