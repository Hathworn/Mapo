; ModuleID = '../data/hip_kernels/175/49/main.cu'
source_filename = "../data/hip_kernels/175/49/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13findCentroidsPiiS_S_PjE11localMasses = internal addrspace(3) global [544 x i32] undef, align 16
@_ZZ13findCentroidsPiiS_S_PjE11localCounts = internal addrspace(3) global [32 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13findCentroidsPiiS_S_Pj(i32 addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp ult i32 %13, 32
  br i1 %15, label %16, label %51

16:                                               ; preds = %5
  %17 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %13
  store i32 0, i32 addrspace(3)* %17, align 4, !tbaa !7
  %18 = add nuw nsw i32 %13, 32
  %19 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %18
  store i32 0, i32 addrspace(3)* %19, align 4, !tbaa !7
  %20 = add nuw nsw i32 %13, 64
  %21 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %20
  store i32 0, i32 addrspace(3)* %21, align 4, !tbaa !7
  %22 = add nuw nsw i32 %13, 96
  %23 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %22
  store i32 0, i32 addrspace(3)* %23, align 4, !tbaa !7
  %24 = add nuw nsw i32 %13, 128
  %25 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %24
  store i32 0, i32 addrspace(3)* %25, align 4, !tbaa !7
  %26 = add nuw nsw i32 %13, 160
  %27 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %26
  store i32 0, i32 addrspace(3)* %27, align 4, !tbaa !7
  %28 = add nuw nsw i32 %13, 192
  %29 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %28
  store i32 0, i32 addrspace(3)* %29, align 4, !tbaa !7
  %30 = add nuw nsw i32 %13, 224
  %31 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %30
  store i32 0, i32 addrspace(3)* %31, align 4, !tbaa !7
  %32 = add nuw nsw i32 %13, 256
  %33 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %32
  store i32 0, i32 addrspace(3)* %33, align 4, !tbaa !7
  %34 = add nuw nsw i32 %13, 288
  %35 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %34
  store i32 0, i32 addrspace(3)* %35, align 4, !tbaa !7
  %36 = add nuw nsw i32 %13, 320
  %37 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %36
  store i32 0, i32 addrspace(3)* %37, align 4, !tbaa !7
  %38 = add nuw nsw i32 %13, 352
  %39 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %38
  store i32 0, i32 addrspace(3)* %39, align 4, !tbaa !7
  %40 = add nuw nsw i32 %13, 384
  %41 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %40
  store i32 0, i32 addrspace(3)* %41, align 4, !tbaa !7
  %42 = add nuw nsw i32 %13, 416
  %43 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %42
  store i32 0, i32 addrspace(3)* %43, align 4, !tbaa !7
  %44 = add nuw nsw i32 %13, 448
  %45 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %44
  store i32 0, i32 addrspace(3)* %45, align 4, !tbaa !7
  %46 = add nuw nsw i32 %13, 480
  %47 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %46
  store i32 0, i32 addrspace(3)* %47, align 4, !tbaa !7
  %48 = add nuw nsw i32 %13, 512
  %49 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %48
  store i32 0, i32 addrspace(3)* %49, align 4, !tbaa !7
  %50 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localCounts, i32 0, i32 %13
  store i32 0, i32 addrspace(3)* %50, align 4, !tbaa !7
  br label %51

51:                                               ; preds = %16, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = icmp slt i32 %14, %1
  br i1 %52, label %53, label %157

53:                                               ; preds = %51
  %54 = sext i32 %14 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %54
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %59 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %56
  %60 = atomicrmw add i32 addrspace(3)* %59, i32 %58 syncscope("agent-one-as") monotonic, align 4
  %61 = add nsw i32 %14, %1
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 32), i32 %56
  %66 = atomicrmw add i32 addrspace(3)* %65, i32 %64 syncscope("agent-one-as") monotonic, align 4
  %67 = add nsw i32 %61, %1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 64), i32 %56
  %72 = atomicrmw add i32 addrspace(3)* %71, i32 %70 syncscope("agent-one-as") monotonic, align 4
  %73 = add nsw i32 %67, %1
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !5
  %77 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 96), i32 %56
  %78 = atomicrmw add i32 addrspace(3)* %77, i32 %76 syncscope("agent-one-as") monotonic, align 4
  %79 = add nsw i32 %73, %1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %80
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 128), i32 %56
  %84 = atomicrmw add i32 addrspace(3)* %83, i32 %82 syncscope("agent-one-as") monotonic, align 4
  %85 = add nsw i32 %79, %1
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 160), i32 %56
  %90 = atomicrmw add i32 addrspace(3)* %89, i32 %88 syncscope("agent-one-as") monotonic, align 4
  %91 = add nsw i32 %85, %1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !5
  %95 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 192), i32 %56
  %96 = atomicrmw add i32 addrspace(3)* %95, i32 %94 syncscope("agent-one-as") monotonic, align 4
  %97 = add nsw i32 %91, %1
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %98
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 224), i32 %56
  %102 = atomicrmw add i32 addrspace(3)* %101, i32 %100 syncscope("agent-one-as") monotonic, align 4
  %103 = add nsw i32 %97, %1
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 256), i32 %56
  %108 = atomicrmw add i32 addrspace(3)* %107, i32 %106 syncscope("agent-one-as") monotonic, align 4
  %109 = add nsw i32 %103, %1
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %110
  %112 = load i32, i32 addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !5
  %113 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 288), i32 %56
  %114 = atomicrmw add i32 addrspace(3)* %113, i32 %112 syncscope("agent-one-as") monotonic, align 4
  %115 = add nsw i32 %109, %1
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %116
  %118 = load i32, i32 addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !5
  %119 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 320), i32 %56
  %120 = atomicrmw add i32 addrspace(3)* %119, i32 %118 syncscope("agent-one-as") monotonic, align 4
  %121 = add nsw i32 %115, %1
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %122
  %124 = load i32, i32 addrspace(1)* %123, align 4, !tbaa !7, !amdgpu.noclobber !5
  %125 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 352), i32 %56
  %126 = atomicrmw add i32 addrspace(3)* %125, i32 %124 syncscope("agent-one-as") monotonic, align 4
  %127 = add nsw i32 %121, %1
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %128
  %130 = load i32, i32 addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 384), i32 %56
  %132 = atomicrmw add i32 addrspace(3)* %131, i32 %130 syncscope("agent-one-as") monotonic, align 4
  %133 = add nsw i32 %127, %1
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %134
  %136 = load i32, i32 addrspace(1)* %135, align 4, !tbaa !7, !amdgpu.noclobber !5
  %137 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 416), i32 %56
  %138 = atomicrmw add i32 addrspace(3)* %137, i32 %136 syncscope("agent-one-as") monotonic, align 4
  %139 = add nsw i32 %133, %1
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %140
  %142 = load i32, i32 addrspace(1)* %141, align 4, !tbaa !7, !amdgpu.noclobber !5
  %143 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 448), i32 %56
  %144 = atomicrmw add i32 addrspace(3)* %143, i32 %142 syncscope("agent-one-as") monotonic, align 4
  %145 = add nsw i32 %139, %1
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %146
  %148 = load i32, i32 addrspace(1)* %147, align 4, !tbaa !7, !amdgpu.noclobber !5
  %149 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 480), i32 %56
  %150 = atomicrmw add i32 addrspace(3)* %149, i32 %148 syncscope("agent-one-as") monotonic, align 4
  %151 = add nsw i32 %145, %1
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %152
  %154 = load i32, i32 addrspace(1)* %153, align 4, !tbaa !7, !amdgpu.noclobber !5
  %155 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 512), i32 %56
  %156 = atomicrmw add i32 addrspace(3)* %155, i32 %154 syncscope("agent-one-as") monotonic, align 4
  br label %157

157:                                              ; preds = %53, %51
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %15, label %158, label %244

158:                                              ; preds = %157
  %159 = zext i32 %13 to i64
  %160 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %159
  %161 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %13
  %162 = load i32, i32 addrspace(3)* %161, align 4, !tbaa !7
  %163 = atomicrmw add i32 addrspace(1)* %160, i32 %162 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %161, align 4, !tbaa !7
  %164 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 32
  %165 = add nuw nsw i32 %13, 32
  %166 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %165
  %167 = load i32, i32 addrspace(3)* %166, align 4, !tbaa !7
  %168 = atomicrmw add i32 addrspace(1)* %164, i32 %167 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %166, align 4, !tbaa !7
  %169 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 64
  %170 = add nuw nsw i32 %13, 64
  %171 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %170
  %172 = load i32, i32 addrspace(3)* %171, align 4, !tbaa !7
  %173 = atomicrmw add i32 addrspace(1)* %169, i32 %172 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %171, align 4, !tbaa !7
  %174 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 96
  %175 = add nuw nsw i32 %13, 96
  %176 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %175
  %177 = load i32, i32 addrspace(3)* %176, align 4, !tbaa !7
  %178 = atomicrmw add i32 addrspace(1)* %174, i32 %177 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %176, align 4, !tbaa !7
  %179 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 128
  %180 = add nuw nsw i32 %13, 128
  %181 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %180
  %182 = load i32, i32 addrspace(3)* %181, align 4, !tbaa !7
  %183 = atomicrmw add i32 addrspace(1)* %179, i32 %182 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %181, align 4, !tbaa !7
  %184 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 160
  %185 = add nuw nsw i32 %13, 160
  %186 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %185
  %187 = load i32, i32 addrspace(3)* %186, align 4, !tbaa !7
  %188 = atomicrmw add i32 addrspace(1)* %184, i32 %187 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %186, align 4, !tbaa !7
  %189 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 192
  %190 = add nuw nsw i32 %13, 192
  %191 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %190
  %192 = load i32, i32 addrspace(3)* %191, align 4, !tbaa !7
  %193 = atomicrmw add i32 addrspace(1)* %189, i32 %192 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %191, align 4, !tbaa !7
  %194 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 224
  %195 = add nuw nsw i32 %13, 224
  %196 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %195
  %197 = load i32, i32 addrspace(3)* %196, align 4, !tbaa !7
  %198 = atomicrmw add i32 addrspace(1)* %194, i32 %197 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %196, align 4, !tbaa !7
  %199 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 256
  %200 = add nuw nsw i32 %13, 256
  %201 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %200
  %202 = load i32, i32 addrspace(3)* %201, align 4, !tbaa !7
  %203 = atomicrmw add i32 addrspace(1)* %199, i32 %202 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %201, align 4, !tbaa !7
  %204 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 288
  %205 = add nuw nsw i32 %13, 288
  %206 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %205
  %207 = load i32, i32 addrspace(3)* %206, align 4, !tbaa !7
  %208 = atomicrmw add i32 addrspace(1)* %204, i32 %207 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %206, align 4, !tbaa !7
  %209 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 320
  %210 = add nuw nsw i32 %13, 320
  %211 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %210
  %212 = load i32, i32 addrspace(3)* %211, align 4, !tbaa !7
  %213 = atomicrmw add i32 addrspace(1)* %209, i32 %212 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %211, align 4, !tbaa !7
  %214 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 352
  %215 = add nuw nsw i32 %13, 352
  %216 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %215
  %217 = load i32, i32 addrspace(3)* %216, align 4, !tbaa !7
  %218 = atomicrmw add i32 addrspace(1)* %214, i32 %217 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %216, align 4, !tbaa !7
  %219 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 384
  %220 = add nuw nsw i32 %13, 384
  %221 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %220
  %222 = load i32, i32 addrspace(3)* %221, align 4, !tbaa !7
  %223 = atomicrmw add i32 addrspace(1)* %219, i32 %222 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %221, align 4, !tbaa !7
  %224 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 416
  %225 = add nuw nsw i32 %13, 416
  %226 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %225
  %227 = load i32, i32 addrspace(3)* %226, align 4, !tbaa !7
  %228 = atomicrmw add i32 addrspace(1)* %224, i32 %227 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %226, align 4, !tbaa !7
  %229 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 448
  %230 = add nuw nsw i32 %13, 448
  %231 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %230
  %232 = load i32, i32 addrspace(3)* %231, align 4, !tbaa !7
  %233 = atomicrmw add i32 addrspace(1)* %229, i32 %232 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %231, align 4, !tbaa !7
  %234 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 480
  %235 = add nuw nsw i32 %13, 480
  %236 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %235
  %237 = load i32, i32 addrspace(3)* %236, align 4, !tbaa !7
  %238 = atomicrmw add i32 addrspace(1)* %234, i32 %237 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %236, align 4, !tbaa !7
  %239 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 512
  %240 = add nuw nsw i32 %13, 512
  %241 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %240
  %242 = load i32, i32 addrspace(3)* %241, align 4, !tbaa !7
  %243 = atomicrmw add i32 addrspace(1)* %239, i32 %242 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %241, align 4, !tbaa !7
  br label %244

244:                                              ; preds = %158, %157
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %52, label %245, label %354

245:                                              ; preds = %244
  %246 = sext i32 %14 to i64
  %247 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %246
  %248 = load i32, i32 addrspace(1)* %247, align 4, !tbaa !7
  %249 = mul nsw i32 %1, 17
  %250 = add nsw i32 %14, %249
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %251
  %253 = load i32, i32 addrspace(1)* %252, align 4, !tbaa !7
  %254 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %248
  %255 = atomicrmw add i32 addrspace(3)* %254, i32 %253 syncscope("agent-one-as") monotonic, align 4
  %256 = add nsw i32 %250, %1
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %257
  %259 = load i32, i32 addrspace(1)* %258, align 4, !tbaa !7
  %260 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 32), i32 %248
  %261 = atomicrmw add i32 addrspace(3)* %260, i32 %259 syncscope("agent-one-as") monotonic, align 4
  %262 = add nsw i32 %256, %1
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %263
  %265 = load i32, i32 addrspace(1)* %264, align 4, !tbaa !7
  %266 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 64), i32 %248
  %267 = atomicrmw add i32 addrspace(3)* %266, i32 %265 syncscope("agent-one-as") monotonic, align 4
  %268 = add nsw i32 %262, %1
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %269
  %271 = load i32, i32 addrspace(1)* %270, align 4, !tbaa !7
  %272 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 96), i32 %248
  %273 = atomicrmw add i32 addrspace(3)* %272, i32 %271 syncscope("agent-one-as") monotonic, align 4
  %274 = add nsw i32 %268, %1
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %275
  %277 = load i32, i32 addrspace(1)* %276, align 4, !tbaa !7
  %278 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 128), i32 %248
  %279 = atomicrmw add i32 addrspace(3)* %278, i32 %277 syncscope("agent-one-as") monotonic, align 4
  %280 = add nsw i32 %274, %1
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %281
  %283 = load i32, i32 addrspace(1)* %282, align 4, !tbaa !7
  %284 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 160), i32 %248
  %285 = atomicrmw add i32 addrspace(3)* %284, i32 %283 syncscope("agent-one-as") monotonic, align 4
  %286 = add nsw i32 %280, %1
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %287
  %289 = load i32, i32 addrspace(1)* %288, align 4, !tbaa !7
  %290 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 192), i32 %248
  %291 = atomicrmw add i32 addrspace(3)* %290, i32 %289 syncscope("agent-one-as") monotonic, align 4
  %292 = add nsw i32 %286, %1
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %293
  %295 = load i32, i32 addrspace(1)* %294, align 4, !tbaa !7
  %296 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 224), i32 %248
  %297 = atomicrmw add i32 addrspace(3)* %296, i32 %295 syncscope("agent-one-as") monotonic, align 4
  %298 = add nsw i32 %292, %1
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %299
  %301 = load i32, i32 addrspace(1)* %300, align 4, !tbaa !7
  %302 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 256), i32 %248
  %303 = atomicrmw add i32 addrspace(3)* %302, i32 %301 syncscope("agent-one-as") monotonic, align 4
  %304 = add nsw i32 %298, %1
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %305
  %307 = load i32, i32 addrspace(1)* %306, align 4, !tbaa !7
  %308 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 288), i32 %248
  %309 = atomicrmw add i32 addrspace(3)* %308, i32 %307 syncscope("agent-one-as") monotonic, align 4
  %310 = add nsw i32 %304, %1
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %311
  %313 = load i32, i32 addrspace(1)* %312, align 4, !tbaa !7
  %314 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 320), i32 %248
  %315 = atomicrmw add i32 addrspace(3)* %314, i32 %313 syncscope("agent-one-as") monotonic, align 4
  %316 = add nsw i32 %310, %1
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %317
  %319 = load i32, i32 addrspace(1)* %318, align 4, !tbaa !7
  %320 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 352), i32 %248
  %321 = atomicrmw add i32 addrspace(3)* %320, i32 %319 syncscope("agent-one-as") monotonic, align 4
  %322 = add nsw i32 %316, %1
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %323
  %325 = load i32, i32 addrspace(1)* %324, align 4, !tbaa !7
  %326 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 384), i32 %248
  %327 = atomicrmw add i32 addrspace(3)* %326, i32 %325 syncscope("agent-one-as") monotonic, align 4
  %328 = add nsw i32 %322, %1
  %329 = sext i32 %328 to i64
  %330 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %329
  %331 = load i32, i32 addrspace(1)* %330, align 4, !tbaa !7
  %332 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 416), i32 %248
  %333 = atomicrmw add i32 addrspace(3)* %332, i32 %331 syncscope("agent-one-as") monotonic, align 4
  %334 = add nsw i32 %328, %1
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %335
  %337 = load i32, i32 addrspace(1)* %336, align 4, !tbaa !7
  %338 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 448), i32 %248
  %339 = atomicrmw add i32 addrspace(3)* %338, i32 %337 syncscope("agent-one-as") monotonic, align 4
  %340 = add nsw i32 %334, %1
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %341
  %343 = load i32, i32 addrspace(1)* %342, align 4, !tbaa !7
  %344 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 480), i32 %248
  %345 = atomicrmw add i32 addrspace(3)* %344, i32 %343 syncscope("agent-one-as") monotonic, align 4
  %346 = add nsw i32 %340, %1
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %347
  %349 = load i32, i32 addrspace(1)* %348, align 4, !tbaa !7
  %350 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 512), i32 %248
  %351 = atomicrmw add i32 addrspace(3)* %350, i32 %349 syncscope("agent-one-as") monotonic, align 4
  %352 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localCounts, i32 0, i32 %248
  %353 = tail call i32 @llvm.amdgcn.atomic.inc.i32.p3i32(i32 addrspace(3)* %352, i32 100000000, i32 2, i32 4, i1 false)
  br label %354

354:                                              ; preds = %245, %244
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %15, label %355, label %446

355:                                              ; preds = %354
  %356 = zext i32 %13 to i64
  %357 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %356
  %358 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 544
  %359 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %13
  %360 = load i32, i32 addrspace(3)* %359, align 4, !tbaa !7
  %361 = atomicrmw add i32 addrspace(1)* %358, i32 %360 syncscope("agent-one-as") monotonic, align 4
  %362 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 576
  %363 = add nuw nsw i32 %13, 32
  %364 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %363
  %365 = load i32, i32 addrspace(3)* %364, align 4, !tbaa !7
  %366 = atomicrmw add i32 addrspace(1)* %362, i32 %365 syncscope("agent-one-as") monotonic, align 4
  %367 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 608
  %368 = add nuw nsw i32 %13, 64
  %369 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %368
  %370 = load i32, i32 addrspace(3)* %369, align 4, !tbaa !7
  %371 = atomicrmw add i32 addrspace(1)* %367, i32 %370 syncscope("agent-one-as") monotonic, align 4
  %372 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 640
  %373 = add nuw nsw i32 %13, 96
  %374 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %373
  %375 = load i32, i32 addrspace(3)* %374, align 4, !tbaa !7
  %376 = atomicrmw add i32 addrspace(1)* %372, i32 %375 syncscope("agent-one-as") monotonic, align 4
  %377 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 672
  %378 = add nuw nsw i32 %13, 128
  %379 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %378
  %380 = load i32, i32 addrspace(3)* %379, align 4, !tbaa !7
  %381 = atomicrmw add i32 addrspace(1)* %377, i32 %380 syncscope("agent-one-as") monotonic, align 4
  %382 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 704
  %383 = add nuw nsw i32 %13, 160
  %384 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %383
  %385 = load i32, i32 addrspace(3)* %384, align 4, !tbaa !7
  %386 = atomicrmw add i32 addrspace(1)* %382, i32 %385 syncscope("agent-one-as") monotonic, align 4
  %387 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 736
  %388 = add nuw nsw i32 %13, 192
  %389 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %388
  %390 = load i32, i32 addrspace(3)* %389, align 4, !tbaa !7
  %391 = atomicrmw add i32 addrspace(1)* %387, i32 %390 syncscope("agent-one-as") monotonic, align 4
  %392 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 768
  %393 = add nuw nsw i32 %13, 224
  %394 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %393
  %395 = load i32, i32 addrspace(3)* %394, align 4, !tbaa !7
  %396 = atomicrmw add i32 addrspace(1)* %392, i32 %395 syncscope("agent-one-as") monotonic, align 4
  %397 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 800
  %398 = add nuw nsw i32 %13, 256
  %399 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %398
  %400 = load i32, i32 addrspace(3)* %399, align 4, !tbaa !7
  %401 = atomicrmw add i32 addrspace(1)* %397, i32 %400 syncscope("agent-one-as") monotonic, align 4
  %402 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 832
  %403 = add nuw nsw i32 %13, 288
  %404 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %403
  %405 = load i32, i32 addrspace(3)* %404, align 4, !tbaa !7
  %406 = atomicrmw add i32 addrspace(1)* %402, i32 %405 syncscope("agent-one-as") monotonic, align 4
  %407 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 864
  %408 = add nuw nsw i32 %13, 320
  %409 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %408
  %410 = load i32, i32 addrspace(3)* %409, align 4, !tbaa !7
  %411 = atomicrmw add i32 addrspace(1)* %407, i32 %410 syncscope("agent-one-as") monotonic, align 4
  %412 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 896
  %413 = add nuw nsw i32 %13, 352
  %414 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %413
  %415 = load i32, i32 addrspace(3)* %414, align 4, !tbaa !7
  %416 = atomicrmw add i32 addrspace(1)* %412, i32 %415 syncscope("agent-one-as") monotonic, align 4
  %417 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 928
  %418 = add nuw nsw i32 %13, 384
  %419 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %418
  %420 = load i32, i32 addrspace(3)* %419, align 4, !tbaa !7
  %421 = atomicrmw add i32 addrspace(1)* %417, i32 %420 syncscope("agent-one-as") monotonic, align 4
  %422 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 960
  %423 = add nuw nsw i32 %13, 416
  %424 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %423
  %425 = load i32, i32 addrspace(3)* %424, align 4, !tbaa !7
  %426 = atomicrmw add i32 addrspace(1)* %422, i32 %425 syncscope("agent-one-as") monotonic, align 4
  %427 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 992
  %428 = add nuw nsw i32 %13, 448
  %429 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %428
  %430 = load i32, i32 addrspace(3)* %429, align 4, !tbaa !7
  %431 = atomicrmw add i32 addrspace(1)* %427, i32 %430 syncscope("agent-one-as") monotonic, align 4
  %432 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 1024
  %433 = add nuw nsw i32 %13, 480
  %434 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %433
  %435 = load i32, i32 addrspace(3)* %434, align 4, !tbaa !7
  %436 = atomicrmw add i32 addrspace(1)* %432, i32 %435 syncscope("agent-one-as") monotonic, align 4
  %437 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 1056
  %438 = add nuw nsw i32 %13, 512
  %439 = getelementptr inbounds [544 x i32], [544 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %438
  %440 = load i32, i32 addrspace(3)* %439, align 4, !tbaa !7
  %441 = atomicrmw add i32 addrspace(1)* %437, i32 %440 syncscope("agent-one-as") monotonic, align 4
  %442 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %356
  %443 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localCounts, i32 0, i32 %13
  %444 = load i32, i32 addrspace(3)* %443, align 4, !tbaa !7
  %445 = atomicrmw add i32 addrspace(1)* %442, i32 %444 syncscope("agent-one-as") monotonic, align 4
  br label %446

446:                                              ; preds = %355, %354
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: argmemonly nounwind willreturn
declare i32 @llvm.amdgcn.atomic.inc.i32.p3i32(i32 addrspace(3)* nocapture, i32, i32 immarg, i32 immarg, i1 immarg) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
