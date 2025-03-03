; ModuleID = '../data/hip_kernels/18096/0/main.cu'
source_filename = "../data/hip_kernels/18096/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15GPU_convolutionPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = shl nsw i32 %8, 5
  %12 = add nsw i32 %11, %10
  %13 = shl nsw i32 %7, 5
  %14 = add nsw i32 %13, %9
  %15 = sdiv i32 %3, 2
  %16 = sub i32 %12, %15
  %17 = sub nsw i32 %14, %15
  %18 = mul nsw i32 %12, %4
  %19 = add nsw i32 %18, %14
  %20 = mul nsw i32 %5, %4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %167

22:                                               ; preds = %6
  %23 = sext i32 %19 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %2, i64 %23
  store float 0.000000e+00, float addrspace(1)* %24, align 4, !tbaa !5
  %25 = icmp sgt i32 %3, 0
  br i1 %25, label %26, label %31

26:                                               ; preds = %22
  %27 = and i32 %3, 3
  %28 = icmp ult i32 %3, 4
  %29 = and i32 %3, -4
  %30 = icmp eq i32 %27, 0
  br label %37

31:                                               ; preds = %75, %22
  %32 = phi float [ 0.000000e+00, %22 ], [ %76, %75 ]
  %33 = fcmp contract ogt float %32, 2.550000e+02
  %34 = select i1 %33, float 2.550000e+02, float %32
  %35 = fcmp contract olt float %34, 0.000000e+00
  %36 = or i1 %33, %35
  br i1 %36, label %165, label %167

37:                                               ; preds = %26, %75
  %38 = phi float [ %76, %75 ], [ 0.000000e+00, %26 ]
  %39 = phi i32 [ %77, %75 ], [ 0, %26 ]
  %40 = add i32 %16, %39
  %41 = mul i32 %40, %4
  %42 = icmp sgt i32 %41, -1
  %43 = icmp slt i32 %41, %20
  %44 = mul nsw i32 %39, %3
  br i1 %28, label %45, label %79

45:                                               ; preds = %160, %37
  %46 = phi float [ undef, %37 ], [ %161, %160 ]
  %47 = phi float [ %38, %37 ], [ %161, %160 ]
  %48 = phi i32 [ 0, %37 ], [ %162, %160 ]
  br i1 %30, label %75, label %49

49:                                               ; preds = %45, %70
  %50 = phi float [ %71, %70 ], [ %47, %45 ]
  %51 = phi i32 [ %72, %70 ], [ %48, %45 ]
  %52 = phi i32 [ %73, %70 ], [ 0, %45 ]
  %53 = add nsw i32 %51, %17
  %54 = icmp sgt i32 %53, -1
  %55 = select i1 %42, i1 %54, i1 false
  %56 = select i1 %55, i1 %43, i1 false
  %57 = icmp slt i32 %53, %4
  %58 = select i1 %56, i1 %57, i1 false
  br i1 %58, label %59, label %70

59:                                               ; preds = %49
  %60 = add nsw i32 %51, %44
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5
  %64 = add nuw nsw i32 %53, %41
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !5
  %68 = fmul contract float %63, %67
  %69 = fadd contract float %50, %68
  store float %69, float addrspace(1)* %24, align 4, !tbaa !5
  br label %70

70:                                               ; preds = %59, %49
  %71 = phi float [ %50, %49 ], [ %69, %59 ]
  %72 = add nuw nsw i32 %51, 1
  %73 = add i32 %52, 1
  %74 = icmp eq i32 %73, %27
  br i1 %74, label %75, label %49, !llvm.loop !9

75:                                               ; preds = %70, %45
  %76 = phi float [ %46, %45 ], [ %71, %70 ]
  %77 = add nuw nsw i32 %39, 1
  %78 = icmp eq i32 %77, %3
  br i1 %78, label %31, label %37, !llvm.loop !11

79:                                               ; preds = %37, %160
  %80 = phi float [ %161, %160 ], [ %38, %37 ]
  %81 = phi i32 [ %162, %160 ], [ 0, %37 ]
  %82 = phi i32 [ %163, %160 ], [ 0, %37 ]
  %83 = add nsw i32 %81, %17
  %84 = icmp sgt i32 %83, -1
  %85 = select i1 %42, i1 %84, i1 false
  %86 = select i1 %85, i1 %43, i1 false
  %87 = icmp slt i32 %83, %4
  %88 = select i1 %86, i1 %87, i1 false
  br i1 %88, label %89, label %100

89:                                               ; preds = %79
  %90 = add nsw i32 %81, %44
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !5
  %94 = add nuw nsw i32 %83, %41
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !5
  %98 = fmul contract float %93, %97
  %99 = fadd contract float %80, %98
  store float %99, float addrspace(1)* %24, align 4, !tbaa !5
  br label %100

100:                                              ; preds = %79, %89
  %101 = phi float [ %80, %79 ], [ %99, %89 ]
  %102 = or i32 %81, 1
  %103 = add nsw i32 %102, %17
  %104 = icmp sgt i32 %103, -1
  %105 = select i1 %42, i1 %104, i1 false
  %106 = select i1 %105, i1 %43, i1 false
  %107 = icmp slt i32 %103, %4
  %108 = select i1 %106, i1 %107, i1 false
  br i1 %108, label %109, label %120

109:                                              ; preds = %100
  %110 = add nsw i32 %102, %44
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !5
  %114 = add nuw nsw i32 %103, %41
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !5
  %118 = fmul contract float %113, %117
  %119 = fadd contract float %101, %118
  store float %119, float addrspace(1)* %24, align 4, !tbaa !5
  br label %120

120:                                              ; preds = %109, %100
  %121 = phi float [ %101, %100 ], [ %119, %109 ]
  %122 = or i32 %81, 2
  %123 = add nsw i32 %122, %17
  %124 = icmp sgt i32 %123, -1
  %125 = select i1 %42, i1 %124, i1 false
  %126 = select i1 %125, i1 %43, i1 false
  %127 = icmp slt i32 %123, %4
  %128 = select i1 %126, i1 %127, i1 false
  br i1 %128, label %129, label %140

129:                                              ; preds = %120
  %130 = add nsw i32 %122, %44
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %1, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !5
  %134 = add nuw nsw i32 %123, %41
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %0, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !5
  %138 = fmul contract float %133, %137
  %139 = fadd contract float %121, %138
  store float %139, float addrspace(1)* %24, align 4, !tbaa !5
  br label %140

140:                                              ; preds = %129, %120
  %141 = phi float [ %121, %120 ], [ %139, %129 ]
  %142 = or i32 %81, 3
  %143 = add nsw i32 %142, %17
  %144 = icmp sgt i32 %143, -1
  %145 = select i1 %42, i1 %144, i1 false
  %146 = select i1 %145, i1 %43, i1 false
  %147 = icmp slt i32 %143, %4
  %148 = select i1 %146, i1 %147, i1 false
  br i1 %148, label %149, label %160

149:                                              ; preds = %140
  %150 = add nsw i32 %142, %44
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %1, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !5
  %154 = add nuw nsw i32 %143, %41
  %155 = zext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %0, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !5
  %158 = fmul contract float %153, %157
  %159 = fadd contract float %141, %158
  store float %159, float addrspace(1)* %24, align 4, !tbaa !5
  br label %160

160:                                              ; preds = %149, %140
  %161 = phi float [ %141, %140 ], [ %159, %149 ]
  %162 = add nuw nsw i32 %81, 4
  %163 = add i32 %82, 4
  %164 = icmp eq i32 %163, %29
  br i1 %164, label %45, label %79, !llvm.loop !13

165:                                              ; preds = %31
  %166 = select i1 %35, float 0.000000e+00, float %34
  store float %166, float addrspace(1)* %24, align 4, !tbaa !5
  br label %167

167:                                              ; preds = %165, %31, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
