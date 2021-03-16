class ApplicationService
  def self.call(*args, **params, &block)
    new(*args, **params, &block).call
  end
end