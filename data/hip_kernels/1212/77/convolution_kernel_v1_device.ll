; ModuleID = '../data/hip_kernels/1212/77/main.cu'
source_filename = "../data/hip_kernels/1212/77/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21convolution_kernel_v1PfS_S_iii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = sdiv i32 %5, -2
  %25 = sdiv i32 %5, 2
  %26 = icmp sgt i32 %24, %25
  br i1 %26, label %37, label %27

27:                                               ; preds = %6, %43
  %28 = phi float [ %67, %43 ], [ 0.000000e+00, %6 ]
  %29 = phi i32 [ %44, %43 ], [ %24, %6 ]
  %30 = add nsw i32 %29, %23
  %31 = icmp sgt i32 %30, -1
  %32 = icmp slt i32 %30, %3
  %33 = mul nsw i32 %30, %4
  %34 = add nsw i32 %29, %25
  %35 = mul nsw i32 %34, %5
  %36 = add i32 %35, %25
  br label %46

37:                                               ; preds = %43, %6
  %38 = phi float [ 0.000000e+00, %6 ], [ %67, %43 ]
  %39 = mul nsw i32 %23, %4
  %40 = add nsw i32 %39, %15
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  store float %38, float addrspace(1)* %42, align 4, !tbaa !7
  ret void

43:                                               ; preds = %60
  %44 = add nsw i32 %29, 1
  %45 = icmp slt i32 %29, %25
  br i1 %45, label %27, label %37, !llvm.loop !11

46:                                               ; preds = %27, %60
  %47 = phi float [ %28, %27 ], [ %67, %60 ]
  %48 = phi i32 [ %24, %27 ], [ %68, %60 ]
  %49 = add nsw i32 %48, %15
  br i1 %31, label %50, label %60

50:                                               ; preds = %46
  %51 = icmp sgt i32 %49, -1
  %52 = select i1 %32, i1 %51, i1 false
  %53 = icmp slt i32 %49, %4
  %54 = select i1 %52, i1 %53, i1 false
  br i1 %54, label %55, label %60

55:                                               ; preds = %50
  %56 = add nsw i32 %49, %33
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %60

60:                                               ; preds = %46, %50, %55
  %61 = phi contract float [ %59, %55 ], [ 0.000000e+00, %50 ], [ 0.000000e+00, %46 ]
  %62 = add i32 %36, %48
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %2, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = fmul contract float %61, %65
  %67 = fadd contract float %47, %66
  %68 = add nsw i32 %48, 1
  %69 = icmp slt i32 %48, %25
  br i1 %69, label %46, label %43, !llvm.loop !13
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
!13 = distinct !{!13, !12}
