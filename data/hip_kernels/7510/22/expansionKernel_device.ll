; ModuleID = '../data/hip_kernels/7510/22/main.cu'
source_filename = "../data/hip_kernels/7510/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15expansionKerneliPfPiiiiiiiiS_S0_(i32 %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, float addrspace(1)* nocapture writeonly %10, i32 addrspace(1)* nocapture writeonly %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %16 = freeze i32 %14
  %17 = freeze i32 %5
  %18 = sdiv i32 %16, %17
  %19 = mul i32 %18, %17
  %20 = sub i32 %16, %19
  %21 = freeze i32 %15
  %22 = freeze i32 %6
  %23 = sdiv i32 %21, %22
  %24 = mul i32 %23, %22
  %25 = sub i32 %21, %24
  %26 = add nsw i32 %23, %18
  %27 = mul nsw i32 %13, %9
  %28 = mul nsw i32 %14, %8
  %29 = add i32 %28, %15
  %30 = add i32 %29, %27
  %31 = icmp slt i32 %13, %0
  br i1 %31, label %32, label %56

32:                                               ; preds = %12
  %33 = sext i32 %13 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !5, !amdgpu.noclobber !9
  %36 = sub i32 1, %7
  %37 = add i32 %36, %35
  %38 = mul nsw i32 %37, %5
  %39 = icmp slt i32 %14, %38
  br i1 %39, label %40, label %49

40:                                               ; preds = %32
  %41 = mul nsw i32 %13, %4
  %42 = mul nsw i32 %26, %3
  %43 = add i32 %20, %41
  %44 = add i32 %43, %25
  %45 = add i32 %44, %42
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !10, !amdgpu.noclobber !9
  br label %49

49:                                               ; preds = %32, %40
  %50 = phi float [ %48, %40 ], [ 0.000000e+00, %32 ]
  %51 = sext i32 %30 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %10, i64 %51
  store float %50, float addrspace(1)* %52, align 4, !tbaa !10
  %53 = icmp eq i32 %14, 0
  %54 = icmp eq i32 %15, 0
  %55 = select i1 %53, i1 %54, i1 false
  br i1 %55, label %60, label %64

56:                                               ; preds = %12
  %57 = sext i32 %30 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %10, i64 %57
  store float 0x7FF8000000000000, float addrspace(1)* %58, align 4, !tbaa !10
  %59 = sext i32 %13 to i64
  br label %60

60:                                               ; preds = %49, %56
  %61 = phi i64 [ %59, %56 ], [ %33, %49 ]
  %62 = phi i32 [ 0, %56 ], [ %38, %49 ]
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %61
  store i32 %62, i32 addrspace(1)* %63, align 4, !tbaa !5
  br label %64

64:                                               ; preds = %60, %49
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !7, i64 0}
