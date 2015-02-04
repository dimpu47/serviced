// Copyright 2014 The Serviced Authors.
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package zookeeper

import (
	zklib "github.com/control-center/go-zookeeper/zk"
)

// Lock creates a object to facilitate create a locking pattern in zookeeper.
type Lock struct {
	lock *zklib.Lock
}

// Lock attempts to acquire the lock.
func (l *Lock) Lock() (err error) {
	return xlateError(l.lock.Lock())
}

// Unlock attempts to release the lock.
func (l *Lock) Unlock() error {
	return xlateError(l.lock.Unlock())
}
