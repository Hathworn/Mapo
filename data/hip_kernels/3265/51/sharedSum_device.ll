; ModuleID = '../data/hip_kernels/3265/51/main.cu'
source_filename = "../data/hip_kernels/3265/51/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9sharedSumiPfS_E3tmp = internal addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9sharedSumiPfS_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %0
  br i1 %13, label %14, label %191

14:                                               ; preds = %3, %14
  %15 = phi i8 addrspace(3)* [ %81, %14 ], [ bitcast ([512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp to i8 addrspace(3)*), %3 ]
  %16 = phi i64 [ %80, %14 ], [ 2048, %3 ]
  store i8 0, i8 addrspace(3)* %15, align 1, !tbaa !7
  %17 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 1
  store i8 0, i8 addrspace(3)* %17, align 1, !tbaa !7
  %18 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 2
  store i8 0, i8 addrspace(3)* %18, align 1, !tbaa !7
  %19 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 3
  store i8 0, i8 addrspace(3)* %19, align 1, !tbaa !7
  %20 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 4
  store i8 0, i8 addrspace(3)* %20, align 1, !tbaa !7
  %21 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 5
  store i8 0, i8 addrspace(3)* %21, align 1, !tbaa !7
  %22 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 6
  store i8 0, i8 addrspace(3)* %22, align 1, !tbaa !7
  %23 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 7
  store i8 0, i8 addrspace(3)* %23, align 1, !tbaa !7
  %24 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 8
  store i8 0, i8 addrspace(3)* %24, align 1, !tbaa !7
  %25 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 9
  store i8 0, i8 addrspace(3)* %25, align 1, !tbaa !7
  %26 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 10
  store i8 0, i8 addrspace(3)* %26, align 1, !tbaa !7
  %27 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 11
  store i8 0, i8 addrspace(3)* %27, align 1, !tbaa !7
  %28 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 12
  store i8 0, i8 addrspace(3)* %28, align 1, !tbaa !7
  %29 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 13
  store i8 0, i8 addrspace(3)* %29, align 1, !tbaa !7
  %30 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 14
  store i8 0, i8 addrspace(3)* %30, align 1, !tbaa !7
  %31 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 15
  store i8 0, i8 addrspace(3)* %31, align 1, !tbaa !7
  %32 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 16
  store i8 0, i8 addrspace(3)* %32, align 1, !tbaa !7
  %33 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 17
  store i8 0, i8 addrspace(3)* %33, align 1, !tbaa !7
  %34 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 18
  store i8 0, i8 addrspace(3)* %34, align 1, !tbaa !7
  %35 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 19
  store i8 0, i8 addrspace(3)* %35, align 1, !tbaa !7
  %36 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 20
  store i8 0, i8 addrspace(3)* %36, align 1, !tbaa !7
  %37 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 21
  store i8 0, i8 addrspace(3)* %37, align 1, !tbaa !7
  %38 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 22
  store i8 0, i8 addrspace(3)* %38, align 1, !tbaa !7
  %39 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 23
  store i8 0, i8 addrspace(3)* %39, align 1, !tbaa !7
  %40 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 24
  store i8 0, i8 addrspace(3)* %40, align 1, !tbaa !7
  %41 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 25
  store i8 0, i8 addrspace(3)* %41, align 1, !tbaa !7
  %42 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 26
  store i8 0, i8 addrspace(3)* %42, align 1, !tbaa !7
  %43 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 27
  store i8 0, i8 addrspace(3)* %43, align 1, !tbaa !7
  %44 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 28
  store i8 0, i8 addrspace(3)* %44, align 1, !tbaa !7
  %45 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 29
  store i8 0, i8 addrspace(3)* %45, align 1, !tbaa !7
  %46 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 30
  store i8 0, i8 addrspace(3)* %46, align 1, !tbaa !7
  %47 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 31
  store i8 0, i8 addrspace(3)* %47, align 1, !tbaa !7
  %48 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 32
  store i8 0, i8 addrspace(3)* %48, align 1, !tbaa !7
  %49 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 33
  store i8 0, i8 addrspace(3)* %49, align 1, !tbaa !7
  %50 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 34
  store i8 0, i8 addrspace(3)* %50, align 1, !tbaa !7
  %51 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 35
  store i8 0, i8 addrspace(3)* %51, align 1, !tbaa !7
  %52 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 36
  store i8 0, i8 addrspace(3)* %52, align 1, !tbaa !7
  %53 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 37
  store i8 0, i8 addrspace(3)* %53, align 1, !tbaa !7
  %54 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 38
  store i8 0, i8 addrspace(3)* %54, align 1, !tbaa !7
  %55 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 39
  store i8 0, i8 addrspace(3)* %55, align 1, !tbaa !7
  %56 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 40
  store i8 0, i8 addrspace(3)* %56, align 1, !tbaa !7
  %57 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 41
  store i8 0, i8 addrspace(3)* %57, align 1, !tbaa !7
  %58 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 42
  store i8 0, i8 addrspace(3)* %58, align 1, !tbaa !7
  %59 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 43
  store i8 0, i8 addrspace(3)* %59, align 1, !tbaa !7
  %60 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 44
  store i8 0, i8 addrspace(3)* %60, align 1, !tbaa !7
  %61 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 45
  store i8 0, i8 addrspace(3)* %61, align 1, !tbaa !7
  %62 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 46
  store i8 0, i8 addrspace(3)* %62, align 1, !tbaa !7
  %63 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 47
  store i8 0, i8 addrspace(3)* %63, align 1, !tbaa !7
  %64 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 48
  store i8 0, i8 addrspace(3)* %64, align 1, !tbaa !7
  %65 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 49
  store i8 0, i8 addrspace(3)* %65, align 1, !tbaa !7
  %66 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 50
  store i8 0, i8 addrspace(3)* %66, align 1, !tbaa !7
  %67 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 51
  store i8 0, i8 addrspace(3)* %67, align 1, !tbaa !7
  %68 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 52
  store i8 0, i8 addrspace(3)* %68, align 1, !tbaa !7
  %69 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 53
  store i8 0, i8 addrspace(3)* %69, align 1, !tbaa !7
  %70 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 54
  store i8 0, i8 addrspace(3)* %70, align 1, !tbaa !7
  %71 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 55
  store i8 0, i8 addrspace(3)* %71, align 1, !tbaa !7
  %72 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 56
  store i8 0, i8 addrspace(3)* %72, align 1, !tbaa !7
  %73 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 57
  store i8 0, i8 addrspace(3)* %73, align 1, !tbaa !7
  %74 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 58
  store i8 0, i8 addrspace(3)* %74, align 1, !tbaa !7
  %75 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 59
  store i8 0, i8 addrspace(3)* %75, align 1, !tbaa !7
  %76 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 60
  store i8 0, i8 addrspace(3)* %76, align 1, !tbaa !7
  %77 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 61
  store i8 0, i8 addrspace(3)* %77, align 1, !tbaa !7
  %78 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 62
  store i8 0, i8 addrspace(3)* %78, align 1, !tbaa !7
  %79 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 63
  store i8 0, i8 addrspace(3)* %79, align 1, !tbaa !7
  %80 = add nsw i64 %16, -64
  %81 = getelementptr inbounds i8, i8 addrspace(3)* %15, i32 64
  %82 = icmp eq i64 %80, 0
  br i1 %82, label %83, label %14, !llvm.loop !10

83:                                               ; preds = %14
  %84 = sext i32 %12 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !12, !amdgpu.noclobber !5
  br label %92

87:                                               ; preds = %92
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %88 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %11
  %89 = load float, float addrspace(3)* %88, align 4, !tbaa !12
  %90 = zext i32 %12 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  store float %89, float addrspace(1)* %91, align 4, !tbaa !12
  br label %191

92:                                               ; preds = %92, %83
  %93 = phi i32 [ 0, %83 ], [ %189, %92 ]
  %94 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %93
  %95 = atomicrmw fadd float addrspace(3)* %94, float %86 syncscope("agent-one-as") monotonic, align 4
  %96 = or i32 %93, 1
  %97 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %96
  %98 = atomicrmw fadd float addrspace(3)* %97, float %86 syncscope("agent-one-as") monotonic, align 4
  %99 = or i32 %93, 2
  %100 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %99
  %101 = atomicrmw fadd float addrspace(3)* %100, float %86 syncscope("agent-one-as") monotonic, align 4
  %102 = or i32 %93, 3
  %103 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %102
  %104 = atomicrmw fadd float addrspace(3)* %103, float %86 syncscope("agent-one-as") monotonic, align 4
  %105 = or i32 %93, 4
  %106 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %105
  %107 = atomicrmw fadd float addrspace(3)* %106, float %86 syncscope("agent-one-as") monotonic, align 4
  %108 = or i32 %93, 5
  %109 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %108
  %110 = atomicrmw fadd float addrspace(3)* %109, float %86 syncscope("agent-one-as") monotonic, align 4
  %111 = or i32 %93, 6
  %112 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %111
  %113 = atomicrmw fadd float addrspace(3)* %112, float %86 syncscope("agent-one-as") monotonic, align 4
  %114 = or i32 %93, 7
  %115 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %114
  %116 = atomicrmw fadd float addrspace(3)* %115, float %86 syncscope("agent-one-as") monotonic, align 4
  %117 = or i32 %93, 8
  %118 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %117
  %119 = atomicrmw fadd float addrspace(3)* %118, float %86 syncscope("agent-one-as") monotonic, align 4
  %120 = or i32 %93, 9
  %121 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %120
  %122 = atomicrmw fadd float addrspace(3)* %121, float %86 syncscope("agent-one-as") monotonic, align 4
  %123 = or i32 %93, 10
  %124 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %123
  %125 = atomicrmw fadd float addrspace(3)* %124, float %86 syncscope("agent-one-as") monotonic, align 4
  %126 = or i32 %93, 11
  %127 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %126
  %128 = atomicrmw fadd float addrspace(3)* %127, float %86 syncscope("agent-one-as") monotonic, align 4
  %129 = or i32 %93, 12
  %130 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %129
  %131 = atomicrmw fadd float addrspace(3)* %130, float %86 syncscope("agent-one-as") monotonic, align 4
  %132 = or i32 %93, 13
  %133 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %132
  %134 = atomicrmw fadd float addrspace(3)* %133, float %86 syncscope("agent-one-as") monotonic, align 4
  %135 = or i32 %93, 14
  %136 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %135
  %137 = atomicrmw fadd float addrspace(3)* %136, float %86 syncscope("agent-one-as") monotonic, align 4
  %138 = or i32 %93, 15
  %139 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %138
  %140 = atomicrmw fadd float addrspace(3)* %139, float %86 syncscope("agent-one-as") monotonic, align 4
  %141 = or i32 %93, 16
  %142 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %141
  %143 = atomicrmw fadd float addrspace(3)* %142, float %86 syncscope("agent-one-as") monotonic, align 4
  %144 = or i32 %93, 17
  %145 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %144
  %146 = atomicrmw fadd float addrspace(3)* %145, float %86 syncscope("agent-one-as") monotonic, align 4
  %147 = or i32 %93, 18
  %148 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %147
  %149 = atomicrmw fadd float addrspace(3)* %148, float %86 syncscope("agent-one-as") monotonic, align 4
  %150 = or i32 %93, 19
  %151 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %150
  %152 = atomicrmw fadd float addrspace(3)* %151, float %86 syncscope("agent-one-as") monotonic, align 4
  %153 = or i32 %93, 20
  %154 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %153
  %155 = atomicrmw fadd float addrspace(3)* %154, float %86 syncscope("agent-one-as") monotonic, align 4
  %156 = or i32 %93, 21
  %157 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %156
  %158 = atomicrmw fadd float addrspace(3)* %157, float %86 syncscope("agent-one-as") monotonic, align 4
  %159 = or i32 %93, 22
  %160 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %159
  %161 = atomicrmw fadd float addrspace(3)* %160, float %86 syncscope("agent-one-as") monotonic, align 4
  %162 = or i32 %93, 23
  %163 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %162
  %164 = atomicrmw fadd float addrspace(3)* %163, float %86 syncscope("agent-one-as") monotonic, align 4
  %165 = or i32 %93, 24
  %166 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %165
  %167 = atomicrmw fadd float addrspace(3)* %166, float %86 syncscope("agent-one-as") monotonic, align 4
  %168 = or i32 %93, 25
  %169 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %168
  %170 = atomicrmw fadd float addrspace(3)* %169, float %86 syncscope("agent-one-as") monotonic, align 4
  %171 = or i32 %93, 26
  %172 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %171
  %173 = atomicrmw fadd float addrspace(3)* %172, float %86 syncscope("agent-one-as") monotonic, align 4
  %174 = or i32 %93, 27
  %175 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %174
  %176 = atomicrmw fadd float addrspace(3)* %175, float %86 syncscope("agent-one-as") monotonic, align 4
  %177 = or i32 %93, 28
  %178 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %177
  %179 = atomicrmw fadd float addrspace(3)* %178, float %86 syncscope("agent-one-as") monotonic, align 4
  %180 = or i32 %93, 29
  %181 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %180
  %182 = atomicrmw fadd float addrspace(3)* %181, float %86 syncscope("agent-one-as") monotonic, align 4
  %183 = or i32 %93, 30
  %184 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %183
  %185 = atomicrmw fadd float addrspace(3)* %184, float %86 syncscope("agent-one-as") monotonic, align 4
  %186 = or i32 %93, 31
  %187 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9sharedSumiPfS_E3tmp, i32 0, i32 %186
  %188 = atomicrmw fadd float addrspace(3)* %187, float %86 syncscope("agent-one-as") monotonic, align 4
  %189 = add nuw nsw i32 %93, 32
  %190 = icmp eq i32 %189, 512
  br i1 %190, label %87, label %92, !llvm.loop !14

191:                                              ; preds = %3, %87
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

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !8, i64 0}
!14 = distinct !{!14, !11}
