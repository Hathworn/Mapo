; ModuleID = '../data/hip_kernels/9430/8/main.cu'
source_filename = "../data/hip_kernels/9430/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28kernel_image2D1C_ConvolveRowPfiisS_S_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i16 %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %15, %1
  %25 = icmp slt i32 %23, %2
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %65

27:                                               ; preds = %6
  %28 = sext i16 %3 to i64
  %29 = sub i16 0, %3
  %30 = icmp sgt i16 %29, %3
  br i1 %30, label %31, label %33

31:                                               ; preds = %27
  %32 = mul nsw i32 %23, %1
  br label %38

33:                                               ; preds = %27
  %34 = trunc i32 %15 to i16
  %35 = trunc i32 %1 to i16
  %36 = add i16 %35, -1
  %37 = mul nsw i32 %23, %1
  br label %44

38:                                               ; preds = %44, %31
  %39 = phi i32 [ %32, %31 ], [ %37, %44 ]
  %40 = phi float [ 0.000000e+00, %31 ], [ %62, %44 ]
  %41 = add nsw i32 %39, %15
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %5, i64 %42
  store float %40, float addrspace(1)* %43, align 4, !tbaa !7
  br label %65

44:                                               ; preds = %33, %44
  %45 = phi i16 [ %29, %33 ], [ %63, %44 ]
  %46 = phi float [ 0.000000e+00, %33 ], [ %62, %44 ]
  %47 = sext i16 %45 to i64
  %48 = add i16 %45, %34
  %49 = tail call i16 @llvm.smax.i16(i16 %48, i16 0)
  %50 = zext i16 %49 to i32
  %51 = icmp slt i32 %50, %1
  %52 = select i1 %51, i16 %49, i16 %36
  %53 = add nsw i64 %47, %28
  %54 = getelementptr inbounds float, float addrspace(1)* %4, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = sext i16 %52 to i32
  %57 = add nsw i32 %37, %56
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = fmul contract float %55, %60
  %62 = fadd contract float %46, %61
  %63 = add i16 %45, 1
  %64 = icmp sgt i16 %63, %3
  br i1 %64, label %38, label %44, !llvm.loop !11

65:                                               ; preds = %6, %38
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.smax.i16(i16, i16) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
