; ModuleID = '../data/hip_kernels/6493/73/main.cu'
source_filename = "../data/hip_kernels/6493/73/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12sortIndexKdeiiPKfS0_PfS1_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %9, %13
  %15 = add i32 %14, %7
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = add i32 %22, %16
  %24 = icmp slt i32 %15, %0
  %25 = icmp slt i32 %23, %1
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %174

27:                                               ; preds = %6
  %28 = mul nsw i32 %23, %0
  %29 = add nsw i32 %28, %15
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !6
  %33 = getelementptr inbounds float, float addrspace(1)* %3, i64 %30
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !6
  %35 = icmp sgt i32 %1, 0
  br i1 %35, label %36, label %84

36:                                               ; preds = %27
  %37 = and i32 %1, 1
  %38 = icmp eq i32 %1, 1
  br i1 %38, label %41, label %39

39:                                               ; preds = %36
  %40 = and i32 %1, -2
  br label %89

41:                                               ; preds = %168, %36
  %42 = phi float [ undef, %36 ], [ %169, %168 ]
  %43 = phi float [ undef, %36 ], [ %170, %168 ]
  %44 = phi i32 [ 0, %36 ], [ %171, %168 ]
  %45 = phi float [ %34, %36 ], [ %170, %168 ]
  %46 = phi float [ %32, %36 ], [ %169, %168 ]
  %47 = icmp eq i32 %37, 0
  br i1 %47, label %84, label %48

48:                                               ; preds = %41
  %49 = mul nsw i32 %44, %0
  %50 = add nsw i32 %49, %15
  %51 = icmp sgt i32 %44, %23
  br i1 %51, label %64, label %52

52:                                               ; preds = %48
  %53 = icmp slt i32 %44, %23
  br i1 %53, label %54, label %84

54:                                               ; preds = %52
  %55 = sext i32 %50 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %2, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !6
  %58 = fcmp contract olt float %57, %46
  %59 = uitofp i1 %58 to float
  %60 = fsub contract float %57, %46
  %61 = fmul contract float %60, %59
  %62 = fadd contract float %46, %61
  %63 = fcmp contract olt float %57, %62
  br label %74

64:                                               ; preds = %48
  %65 = sext i32 %50 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %2, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !6
  %68 = fcmp contract ogt float %67, %46
  %69 = uitofp i1 %68 to float
  %70 = fsub contract float %67, %46
  %71 = fmul contract float %70, %69
  %72 = fadd contract float %46, %71
  %73 = fcmp contract ogt float %67, %72
  br label %74

74:                                               ; preds = %64, %54
  %75 = phi i1 [ %73, %64 ], [ %63, %54 ]
  %76 = phi i64 [ %65, %64 ], [ %55, %54 ]
  %77 = phi float [ %72, %64 ], [ %62, %54 ]
  %78 = uitofp i1 %75 to float
  %79 = getelementptr inbounds float, float addrspace(1)* %3, i64 %76
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7
  %81 = fsub contract float %80, %45
  %82 = fmul contract float %81, %78
  %83 = fadd contract float %45, %82
  br label %84

84:                                               ; preds = %41, %74, %52, %27
  %85 = phi float [ %32, %27 ], [ %42, %41 ], [ %46, %52 ], [ %77, %74 ]
  %86 = phi float [ %34, %27 ], [ %43, %41 ], [ %45, %52 ], [ %83, %74 ]
  %87 = getelementptr inbounds float, float addrspace(1)* %4, i64 %30
  store float %85, float addrspace(1)* %87, align 4, !tbaa !7
  %88 = getelementptr inbounds float, float addrspace(1)* %5, i64 %30
  store float %86, float addrspace(1)* %88, align 4, !tbaa !7
  br label %174

89:                                               ; preds = %168, %39
  %90 = phi i32 [ 0, %39 ], [ %171, %168 ]
  %91 = phi float [ %34, %39 ], [ %170, %168 ]
  %92 = phi float [ %32, %39 ], [ %169, %168 ]
  %93 = phi i32 [ 0, %39 ], [ %172, %168 ]
  %94 = mul nsw i32 %90, %0
  %95 = add nsw i32 %94, %15
  %96 = icmp sgt i32 %90, %23
  br i1 %96, label %97, label %107

97:                                               ; preds = %89
  %98 = sext i32 %95 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %2, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !6
  %101 = fcmp contract ogt float %100, %92
  %102 = uitofp i1 %101 to float
  %103 = fsub contract float %100, %92
  %104 = fmul contract float %103, %102
  %105 = fadd contract float %92, %104
  %106 = fcmp contract ogt float %100, %105
  br label %119

107:                                              ; preds = %89
  %108 = icmp slt i32 %90, %23
  br i1 %108, label %109, label %129

109:                                              ; preds = %107
  %110 = sext i32 %95 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %2, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !6
  %113 = fcmp contract olt float %112, %92
  %114 = uitofp i1 %113 to float
  %115 = fsub contract float %112, %92
  %116 = fmul contract float %115, %114
  %117 = fadd contract float %92, %116
  %118 = fcmp contract olt float %112, %117
  br label %119

119:                                              ; preds = %109, %97
  %120 = phi i1 [ %106, %97 ], [ %118, %109 ]
  %121 = phi i64 [ %98, %97 ], [ %110, %109 ]
  %122 = phi float [ %105, %97 ], [ %117, %109 ]
  %123 = uitofp i1 %120 to float
  %124 = getelementptr inbounds float, float addrspace(1)* %3, i64 %121
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7
  %126 = fsub contract float %125, %91
  %127 = fmul contract float %126, %123
  %128 = fadd contract float %91, %127
  br label %129

129:                                              ; preds = %119, %107
  %130 = phi float [ %92, %107 ], [ %122, %119 ]
  %131 = phi float [ %91, %107 ], [ %128, %119 ]
  %132 = or i32 %90, 1
  %133 = mul nsw i32 %132, %0
  %134 = add nsw i32 %133, %15
  %135 = icmp slt i32 %90, %23
  br i1 %135, label %136, label %148

136:                                              ; preds = %129
  %137 = icmp slt i32 %132, %23
  br i1 %137, label %138, label %168

138:                                              ; preds = %136
  %139 = sext i32 %134 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %2, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7, !amdgpu.noclobber !6
  %142 = fcmp contract olt float %141, %130
  %143 = uitofp i1 %142 to float
  %144 = fsub contract float %141, %130
  %145 = fmul contract float %144, %143
  %146 = fadd contract float %130, %145
  %147 = fcmp contract olt float %141, %146
  br label %158

148:                                              ; preds = %129
  %149 = sext i32 %134 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %2, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7, !amdgpu.noclobber !6
  %152 = fcmp contract ogt float %151, %130
  %153 = uitofp i1 %152 to float
  %154 = fsub contract float %151, %130
  %155 = fmul contract float %154, %153
  %156 = fadd contract float %130, %155
  %157 = fcmp contract ogt float %151, %156
  br label %158

158:                                              ; preds = %148, %138
  %159 = phi i1 [ %157, %148 ], [ %147, %138 ]
  %160 = phi i64 [ %149, %148 ], [ %139, %138 ]
  %161 = phi float [ %156, %148 ], [ %146, %138 ]
  %162 = uitofp i1 %159 to float
  %163 = getelementptr inbounds float, float addrspace(1)* %3, i64 %160
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !7
  %165 = fsub contract float %164, %131
  %166 = fmul contract float %165, %162
  %167 = fadd contract float %131, %166
  br label %168

168:                                              ; preds = %158, %136
  %169 = phi float [ %130, %136 ], [ %161, %158 ]
  %170 = phi float [ %131, %136 ], [ %167, %158 ]
  %171 = add nuw nsw i32 %90, 2
  %172 = add i32 %93, 2
  %173 = icmp eq i32 %172, %40
  br i1 %173, label %41, label %89, !llvm.loop !11

174:                                              ; preds = %84, %6
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
