; ModuleID = '../data/hip_kernels/7626/5/main.cu'
source_filename = "../data/hip_kernels/7626/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17convdx_gpu_kernelPfS_S_iii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
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
  %24 = icmp slt i32 %15, %5
  %25 = icmp slt i32 %23, %4
  %26 = select i1 %24, i1 %25, i1 false
  %27 = icmp sgt i32 %3, 0
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %156

29:                                               ; preds = %6
  %30 = mul nsw i32 %15, %3
  %31 = mul nsw i32 %23, %3
  %32 = mul nsw i32 %15, %4
  %33 = add nsw i32 %32, %23
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7
  %37 = and i32 %3, 7
  %38 = icmp ult i32 %3, 8
  br i1 %38, label %135, label %39

39:                                               ; preds = %29
  %40 = and i32 %3, -8
  br label %41

41:                                               ; preds = %41, %39
  %42 = phi float [ %36, %39 ], [ %131, %41 ]
  %43 = phi i32 [ 0, %39 ], [ %132, %41 ]
  %44 = phi i32 [ 0, %39 ], [ %133, %41 ]
  %45 = add nsw i32 %43, %30
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7
  %49 = add nsw i32 %43, %31
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = fmul contract float %48, %52
  %54 = fadd contract float %42, %53
  store float %54, float addrspace(1)* %35, align 4, !tbaa !7
  %55 = or i32 %43, 1
  %56 = add nsw i32 %55, %30
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = add nsw i32 %55, %31
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %2, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7
  %64 = fmul contract float %59, %63
  %65 = fadd contract float %54, %64
  store float %65, float addrspace(1)* %35, align 4, !tbaa !7
  %66 = or i32 %43, 2
  %67 = add nsw i32 %66, %30
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = add nsw i32 %66, %31
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = fmul contract float %70, %74
  %76 = fadd contract float %65, %75
  store float %76, float addrspace(1)* %35, align 4, !tbaa !7
  %77 = or i32 %43, 3
  %78 = add nsw i32 %77, %30
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7
  %82 = add nsw i32 %77, %31
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %2, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7
  %86 = fmul contract float %81, %85
  %87 = fadd contract float %76, %86
  store float %87, float addrspace(1)* %35, align 4, !tbaa !7
  %88 = or i32 %43, 4
  %89 = add nsw i32 %88, %30
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = add nsw i32 %88, %31
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %97 = fmul contract float %92, %96
  %98 = fadd contract float %87, %97
  store float %98, float addrspace(1)* %35, align 4, !tbaa !7
  %99 = or i32 %43, 5
  %100 = add nsw i32 %99, %30
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7
  %104 = add nsw i32 %99, %31
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %2, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7
  %108 = fmul contract float %103, %107
  %109 = fadd contract float %98, %108
  store float %109, float addrspace(1)* %35, align 4, !tbaa !7
  %110 = or i32 %43, 6
  %111 = add nsw i32 %110, %30
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7
  %115 = add nsw i32 %110, %31
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %2, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7
  %119 = fmul contract float %114, %118
  %120 = fadd contract float %109, %119
  store float %120, float addrspace(1)* %35, align 4, !tbaa !7
  %121 = or i32 %43, 7
  %122 = add nsw i32 %121, %30
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %1, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7
  %126 = add nsw i32 %121, %31
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %2, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7
  %130 = fmul contract float %125, %129
  %131 = fadd contract float %120, %130
  store float %131, float addrspace(1)* %35, align 4, !tbaa !7
  %132 = add nuw nsw i32 %43, 8
  %133 = add i32 %44, 8
  %134 = icmp eq i32 %133, %40
  br i1 %134, label %135, label %41, !llvm.loop !11

135:                                              ; preds = %41, %29
  %136 = phi float [ %36, %29 ], [ %131, %41 ]
  %137 = phi i32 [ 0, %29 ], [ %132, %41 ]
  %138 = icmp eq i32 %37, 0
  br i1 %138, label %156, label %139

139:                                              ; preds = %135, %139
  %140 = phi float [ %152, %139 ], [ %136, %135 ]
  %141 = phi i32 [ %153, %139 ], [ %137, %135 ]
  %142 = phi i32 [ %154, %139 ], [ 0, %135 ]
  %143 = add nsw i32 %141, %30
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7
  %147 = add nsw i32 %141, %31
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %2, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7
  %151 = fmul contract float %146, %150
  %152 = fadd contract float %140, %151
  store float %152, float addrspace(1)* %35, align 4, !tbaa !7
  %153 = add nuw nsw i32 %141, 1
  %154 = add i32 %142, 1
  %155 = icmp eq i32 %154, %37
  br i1 %155, label %156, label %139, !llvm.loop !13

156:                                              ; preds = %135, %139, %6
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
