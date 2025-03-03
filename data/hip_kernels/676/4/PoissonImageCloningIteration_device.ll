; ModuleID = '../data/hip_kernels/676/4/main.cu'
source_filename = "../data/hip_kernels/676/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z28PoissonImageCloningIterationPKfS0_S0_Pfii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
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
  %26 = add nsw i32 %15, -1
  %27 = mul nsw i32 %26, %4
  %28 = add nsw i32 %27, %23
  %29 = add nsw i32 %25, -1
  %30 = add nsw i32 %15, 1
  %31 = mul nsw i32 %30, %4
  %32 = add nsw i32 %31, %23
  %33 = add nsw i32 %25, 1
  %34 = icmp slt i32 %15, %5
  %35 = icmp slt i32 %23, %4
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %148

37:                                               ; preds = %6
  %38 = mul nsw i32 %25, 3
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = fadd contract float %41, 0.000000e+00
  %43 = getelementptr inbounds float, float addrspace(1)* %40, i64 1
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = fadd contract float %44, 0.000000e+00
  %46 = getelementptr inbounds float, float addrspace(1)* %40, i64 2
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = fadd contract float %47, 0.000000e+00
  %49 = icmp sgt i32 %15, 0
  br i1 %49, label %50, label %67

50:                                               ; preds = %37
  %51 = sext i32 %28 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !5
  %54 = fcmp contract ogt float %53, 1.270000e+02
  br i1 %54, label %55, label %67

55:                                               ; preds = %50
  %56 = mul nsw i32 %28, 3
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  %60 = fadd contract float %42, %59
  %61 = getelementptr inbounds float, float addrspace(1)* %58, i64 1
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = fadd contract float %45, %62
  %64 = getelementptr inbounds float, float addrspace(1)* %58, i64 2
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = fadd contract float %48, %65
  br label %67

67:                                               ; preds = %50, %55, %37
  %68 = phi float [ %60, %55 ], [ %42, %50 ], [ %42, %37 ]
  %69 = phi float [ %63, %55 ], [ %45, %50 ], [ %45, %37 ]
  %70 = phi float [ %66, %55 ], [ %48, %50 ], [ %48, %37 ]
  %71 = icmp sgt i32 %23, 0
  br i1 %71, label %72, label %89

72:                                               ; preds = %67
  %73 = sext i32 %29 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = fcmp contract ogt float %75, 1.270000e+02
  br i1 %76, label %77, label %89

77:                                               ; preds = %72
  %78 = mul nsw i32 %29, 3
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %2, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !5
  %82 = fadd contract float %68, %81
  %83 = getelementptr inbounds float, float addrspace(1)* %80, i64 1
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !5
  %85 = fadd contract float %69, %84
  %86 = getelementptr inbounds float, float addrspace(1)* %80, i64 2
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = fadd contract float %70, %87
  br label %89

89:                                               ; preds = %72, %77, %67
  %90 = phi float [ %82, %77 ], [ %68, %72 ], [ %68, %67 ]
  %91 = phi float [ %85, %77 ], [ %69, %72 ], [ %69, %67 ]
  %92 = phi float [ %88, %77 ], [ %70, %72 ], [ %70, %67 ]
  %93 = icmp slt i32 %30, %5
  br i1 %93, label %94, label %111

94:                                               ; preds = %89
  %95 = sext i32 %32 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = fcmp contract ogt float %97, 1.270000e+02
  br i1 %98, label %99, label %111

99:                                               ; preds = %94
  %100 = mul nsw i32 %32, 3
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = fadd contract float %90, %103
  %105 = getelementptr inbounds float, float addrspace(1)* %102, i64 1
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = fadd contract float %91, %106
  %108 = getelementptr inbounds float, float addrspace(1)* %102, i64 2
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !5
  %110 = fadd contract float %92, %109
  br label %111

111:                                              ; preds = %94, %99, %89
  %112 = phi float [ %104, %99 ], [ %90, %94 ], [ %90, %89 ]
  %113 = phi float [ %107, %99 ], [ %91, %94 ], [ %91, %89 ]
  %114 = phi float [ %110, %99 ], [ %92, %94 ], [ %92, %89 ]
  %115 = add nsw i32 %23, 1
  %116 = icmp slt i32 %115, %4
  br i1 %116, label %117, label %134

117:                                              ; preds = %111
  %118 = sext i32 %33 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %1, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7, !amdgpu.noclobber !5
  %121 = fcmp contract ogt float %120, 1.270000e+02
  br i1 %121, label %122, label %134

122:                                              ; preds = %117
  %123 = mul nsw i32 %33, 3
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %2, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = fadd contract float %112, %126
  %128 = getelementptr inbounds float, float addrspace(1)* %125, i64 1
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7, !amdgpu.noclobber !5
  %130 = fadd contract float %113, %129
  %131 = getelementptr inbounds float, float addrspace(1)* %125, i64 2
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7, !amdgpu.noclobber !5
  %133 = fadd contract float %114, %132
  br label %134

134:                                              ; preds = %117, %122, %111
  %135 = phi float [ %127, %122 ], [ %112, %117 ], [ %112, %111 ]
  %136 = phi float [ %130, %122 ], [ %113, %117 ], [ %113, %111 ]
  %137 = phi float [ %133, %122 ], [ %114, %117 ], [ %114, %111 ]
  %138 = fmul contract float %135, 2.500000e-01
  %139 = getelementptr inbounds float, float addrspace(1)* %3, i64 %39
  store float %138, float addrspace(1)* %139, align 4, !tbaa !7
  %140 = fmul contract float %136, 2.500000e-01
  %141 = add nsw i32 %38, 1
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %3, i64 %142
  store float %140, float addrspace(1)* %143, align 4, !tbaa !7
  %144 = fmul contract float %137, 2.500000e-01
  %145 = add nsw i32 %38, 2
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %3, i64 %146
  store float %144, float addrspace(1)* %147, align 4, !tbaa !7
  br label %148

148:                                              ; preds = %134, %6
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
