require "spec_helper"

describe Dropbox::API::Client do

  before do
    # pending
    @client = Dropbox::Spec.instance
  end

  describe "#initialize" do

    it "has a handle to the connection" do
      @client.connection.should be_an_instance_of(Dropbox::API::Connection)
    end

  end

  describe "#account" do

    it "retrieves the account object" do
      response = @client.account
      response.should be_an_instance_of(Dropbox::API::Object)
    end

  end

  describe "#ls" do

    it "returns an array of files and dirs" do
      result = @client.ls
      result.should be_an_instance_of(Array)
    end

    it "returns a single item array of if we ls a file" do
      result     = @client.ls
      first_file = result.detect { |f| f.class == Dropbox::API::File }
      result     = @client.ls first_file.path
      result.should be_an_instance_of(Array)
    end

  end

  describe "#mkdir" do

    it "returns an array of files and dirs" do
      dirname  = "test/test-dir-#{Dropbox::Spec.namespace}"
      response = @client.mkdir dirname
      response.path.should == dirname
      response.should be_an_instance_of(Dropbox::API::Dir)
    end

  end

  describe "#upload" do

    it "puts the file in dropbox" do
      filename = "test/test-#{Dropbox::Spec.namespace}.txt"
      response = @client.upload filename, "Some file"
      response.path.should == filename
      response.bytes.should == 9
    end

  end

  describe "#search" do

    it "finds a file" do
      filename = "test/searchable-test-#{Dropbox::Spec.namespace}.txt"
      @client.upload filename, "Some file"
      response = @client.search "searchable-test-#{Dropbox::Spec.namespace}", :path => 'test'
      response.size.should == 1
      response.first.class.should == Dropbox::API::File
    end

  end

  describe "#download" do

    it "downloads a file from Dropbox" do
      file = @client.download 'test/test.txt'
      file.should == "Some file"
    end

    it "raises a 404 when a file is not found in Dropbox" do
      lambda {
        @client.download 'test/no.txt'
      }.should raise_error(Dropbox::API::Error::NotFound)
    end

  end

end
