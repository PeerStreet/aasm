class ProvidedState
  attr_accessor :transient_store, :persisted_store
  include AASM
  aasm do
    state :alpha, :initial => true
    state :beta
    state :gamma
    event :release do
      transitions :from => [:alpha, :beta, :gamma], :to => :beta
    end
  end

  def aasm_read_state
    :beta
  end

  def aasm_write_state(new_state)
    @persisted_store = new_state
  end

  def aasm_write_state_without_persistence(new_state)
    @transient_store = new_state
  end
end
