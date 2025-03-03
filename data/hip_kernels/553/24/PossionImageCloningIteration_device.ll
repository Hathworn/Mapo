; ModuleID = '../data/hip_kernels/553/24/main.cu'
source_filename = "../data/hip_kernels/553/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28PossionImageCloningIterationPKfS0_PfS1_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = mul nsw i32 %15, %4
  %25 = add nsw i32 %24, %23
  %26 = icmp slt i32 %15, %5
  %27 = icmp slt i32 %23, %4
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %185

29:                                               ; preds = %6
  %30 = sext i32 %25 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  %33 = fcmp contract ogt float %32, 1.270000e+02
  br i1 %33, label %34, label %185

34:                                               ; preds = %29
  %35 = add nsw i32 %15, -1
  %36 = mul nsw i32 %35, %4
  %37 = add nsw i32 %36, %23
  %38 = icmp sgt i32 %23, -1
  br i1 %38, label %39, label %64

39:                                               ; preds = %34
  %40 = icmp sgt i32 %15, 0
  %41 = icmp sle i32 %15, %5
  %42 = select i1 %40, i1 %41, i1 false
  br i1 %42, label %43, label %64

43:                                               ; preds = %39
  %44 = sext i32 %37 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = fcmp contract ogt float %46, 1.270000e+02
  br i1 %47, label %48, label %64

48:                                               ; preds = %43
  %49 = mul nsw i32 %37, 3
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = fadd contract float %52, 0.000000e+00
  %54 = add nsw i32 %49, 1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %2, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %58 = fadd contract float %57, 0.000000e+00
  %59 = add nsw i32 %49, 2
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = fadd contract float %62, 0.000000e+00
  br label %64

64:                                               ; preds = %48, %43, %39, %34
  %65 = phi float [ %63, %48 ], [ 0.000000e+00, %43 ], [ 0.000000e+00, %39 ], [ 0.000000e+00, %34 ]
  %66 = phi float [ %58, %48 ], [ 0.000000e+00, %43 ], [ 0.000000e+00, %39 ], [ 0.000000e+00, %34 ]
  %67 = phi float [ %53, %48 ], [ 0.000000e+00, %43 ], [ 0.000000e+00, %39 ], [ 0.000000e+00, %34 ]
  %68 = add nsw i32 %23, 1
  %69 = add nsw i32 %24, %68
  %70 = icmp sgt i32 %23, -2
  br i1 %70, label %71, label %96

71:                                               ; preds = %64
  %72 = icmp slt i32 %68, %4
  %73 = icmp sgt i32 %15, -1
  %74 = select i1 %72, i1 %73, i1 false
  br i1 %74, label %75, label %96

75:                                               ; preds = %71
  %76 = sext i32 %69 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = fcmp contract ogt float %78, 1.270000e+02
  br i1 %79, label %80, label %96

80:                                               ; preds = %75
  %81 = mul nsw i32 %69, 3
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %2, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !5
  %85 = fadd contract float %67, %84
  %86 = add nsw i32 %81, 1
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %2, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = fadd contract float %66, %89
  %91 = add nsw i32 %81, 2
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %2, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !5
  %95 = fadd contract float %65, %94
  br label %96

96:                                               ; preds = %80, %75, %71, %64
  %97 = phi float [ %95, %80 ], [ %65, %75 ], [ %65, %71 ], [ %65, %64 ]
  %98 = phi float [ %90, %80 ], [ %66, %75 ], [ %66, %71 ], [ %66, %64 ]
  %99 = phi float [ %85, %80 ], [ %67, %75 ], [ %67, %71 ], [ %67, %64 ]
  %100 = add nsw i32 %15, 1
  %101 = mul nsw i32 %100, %4
  %102 = add nsw i32 %101, %23
  br i1 %38, label %103, label %128

103:                                              ; preds = %96
  %104 = icmp sgt i32 %15, -2
  %105 = icmp slt i32 %100, %5
  %106 = select i1 %104, i1 %105, i1 false
  br i1 %106, label %107, label %128

107:                                              ; preds = %103
  %108 = sext i32 %102 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !5
  %111 = fcmp contract ogt float %110, 1.270000e+02
  br i1 %111, label %112, label %128

112:                                              ; preds = %107
  %113 = mul nsw i32 %102, 3
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %2, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = fadd contract float %99, %116
  %118 = add nsw i32 %113, 1
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %2, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !5
  %122 = fadd contract float %98, %121
  %123 = add nsw i32 %113, 2
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %2, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = fadd contract float %97, %126
  br label %128

128:                                              ; preds = %112, %107, %103, %96
  %129 = phi float [ %127, %112 ], [ %97, %107 ], [ %97, %103 ], [ %97, %96 ]
  %130 = phi float [ %122, %112 ], [ %98, %107 ], [ %98, %103 ], [ %98, %96 ]
  %131 = phi float [ %117, %112 ], [ %99, %107 ], [ %99, %103 ], [ %99, %96 ]
  %132 = add nsw i32 %23, -1
  %133 = add nsw i32 %24, %132
  %134 = icmp sgt i32 %23, 0
  br i1 %134, label %135, label %160

135:                                              ; preds = %128
  %136 = icmp sle i32 %23, %4
  %137 = icmp sgt i32 %15, -1
  %138 = select i1 %136, i1 %137, i1 false
  br i1 %138, label %139, label %160

139:                                              ; preds = %135
  %140 = sext i32 %133 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %1, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !7, !amdgpu.noclobber !5
  %143 = fcmp contract ogt float %142, 1.270000e+02
  br i1 %143, label %144, label %160

144:                                              ; preds = %139
  %145 = mul nsw i32 %133, 3
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %2, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !7, !amdgpu.noclobber !5
  %149 = fadd contract float %131, %148
  %150 = add nsw i32 %145, 1
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %2, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7, !amdgpu.noclobber !5
  %154 = fadd contract float %130, %153
  %155 = add nsw i32 %145, 2
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %2, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7, !amdgpu.noclobber !5
  %159 = fadd contract float %129, %158
  br label %160

160:                                              ; preds = %144, %139, %135, %128
  %161 = phi float [ %159, %144 ], [ %129, %139 ], [ %129, %135 ], [ %129, %128 ]
  %162 = phi float [ %154, %144 ], [ %130, %139 ], [ %130, %135 ], [ %130, %128 ]
  %163 = phi float [ %149, %144 ], [ %131, %139 ], [ %131, %135 ], [ %131, %128 ]
  %164 = mul nsw i32 %25, 3
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %0, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !7, !amdgpu.noclobber !5
  %168 = fmul contract float %163, 2.500000e-01
  %169 = fadd contract float %168, %167
  %170 = getelementptr inbounds float, float addrspace(1)* %3, i64 %165
  store float %169, float addrspace(1)* %170, align 4, !tbaa !7
  %171 = add nsw i32 %164, 1
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %0, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !7
  %175 = fmul contract float %162, 2.500000e-01
  %176 = fadd contract float %175, %174
  %177 = getelementptr inbounds float, float addrspace(1)* %3, i64 %172
  store float %176, float addrspace(1)* %177, align 4, !tbaa !7
  %178 = add nsw i32 %164, 2
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %0, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !7
  %182 = fmul contract float %161, 2.500000e-01
  %183 = fadd contract float %182, %181
  %184 = getelementptr inbounds float, float addrspace(1)* %3, i64 %179
  store float %183, float addrspace(1)* %184, align 4, !tbaa !7
  br label %185

185:                                              ; preds = %160, %29, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
