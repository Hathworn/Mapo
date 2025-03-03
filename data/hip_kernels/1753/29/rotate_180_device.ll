; ModuleID = '../data/hip_kernels/1753/29/main.cu'
source_filename = "../data/hip_kernels/1753/29/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10rotate_180PfiiijE17shared_lower_data = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16
@_ZZ10rotate_180PfiiijE17shared_upper_data = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z10rotate_180Pfiiij(float addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = shl i32 %7, 7
  %9 = add i32 %8, %6
  %10 = add i32 %9, %3
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %0, i64 %11
  %13 = load float, float addrspace(1)* %12, align 4, !tbaa !5, !amdgpu.noclobber !9
  %14 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10rotate_180PfiiijE17shared_lower_data, i32 0, i32 %6
  store float %13, float addrspace(3)* %14, align 4, !tbaa !5
  %15 = xor i32 %7, -1
  %16 = shl i32 %15, 7
  %17 = add i32 %16, %6
  %18 = add i32 %17, %2
  %19 = sub i32 %18, %3
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5, !amdgpu.noclobber !9
  %23 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10rotate_180PfiiijE17shared_upper_data, i32 0, i32 %6
  store float %22, float addrspace(3)* %23, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %24 = icmp eq i32 %4, 0
  br i1 %24, label %25, label %30

25:                                               ; preds = %5
  %26 = load float, float addrspace(3)* %14, align 4, !tbaa !5
  %27 = sub nsw i32 127, %6
  %28 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10rotate_180PfiiijE17shared_upper_data, i32 0, i32 %27
  %29 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  store float %29, float addrspace(3)* %14, align 4, !tbaa !5
  store float %26, float addrspace(3)* %28, align 4, !tbaa !5
  br label %37

30:                                               ; preds = %5
  %31 = icmp ult i32 %6, %4
  br i1 %31, label %32, label %37

32:                                               ; preds = %30
  %33 = load float, float addrspace(3)* %14, align 4, !tbaa !5
  %34 = sub nsw i32 127, %6
  %35 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10rotate_180PfiiijE17shared_upper_data, i32 0, i32 %34
  %36 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  store float %36, float addrspace(3)* %14, align 4, !tbaa !5
  store float %33, float addrspace(3)* %35, align 4, !tbaa !5
  br label %37

37:                                               ; preds = %30, %32, %25
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %24, label %38, label %40

38:                                               ; preds = %37
  %39 = load float, float addrspace(3)* %14, align 4, !tbaa !5
  store float %39, float addrspace(1)* %12, align 4, !tbaa !5
  br label %50

40:                                               ; preds = %37
  %41 = icmp ult i32 %6, %4
  br i1 %41, label %42, label %54

42:                                               ; preds = %40
  %43 = sub nsw i32 127, %6
  %44 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10rotate_180PfiiijE17shared_upper_data, i32 0, i32 %43
  %45 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %46 = xor i32 %10, -1
  %47 = add i32 %46, %2
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  store float %45, float addrspace(1)* %49, align 4, !tbaa !5
  br label %50

50:                                               ; preds = %38, %42
  %51 = phi float addrspace(3)* [ %14, %42 ], [ %23, %38 ]
  %52 = phi float addrspace(1)* [ %12, %42 ], [ %21, %38 ]
  %53 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  store float %53, float addrspace(1)* %52, align 4, !tbaa !5
  br label %54

54:                                               ; preds = %50, %40
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!9 = !{}
