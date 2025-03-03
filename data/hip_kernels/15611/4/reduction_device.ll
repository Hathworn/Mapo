; ModuleID = '../data/hip_kernels/15611/4/main.cu'
source_filename = "../data/hip_kernels/15611/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9reductionPiS_E3tmp = internal unnamed_addr addrspace(3) global [16 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z9reductionPiS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add i32 %10, %3
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %12
  %14 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !7, !amdgpu.noclobber !6
  %15 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ9reductionPiS_E3tmp, i32 0, i32 %3
  store i32 %14, i32 addrspace(3)* %15, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %16 = lshr i32 %9, 1
  %17 = icmp ult i32 %3, %16
  br i1 %17, label %18, label %24

18:                                               ; preds = %2
  %19 = add nuw nsw i32 %16, %3
  %20 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ9reductionPiS_E3tmp, i32 0, i32 %19
  %21 = load i32, i32 addrspace(3)* %20, align 4, !tbaa !7
  %22 = load i32, i32 addrspace(3)* %15, align 4, !tbaa !7
  %23 = add nsw i32 %22, %21
  store i32 %23, i32 addrspace(3)* %15, align 4, !tbaa !7
  br label %24

24:                                               ; preds = %18, %2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %25 = lshr i32 %9, 2
  %26 = icmp ult i32 %3, %25
  br i1 %26, label %27, label %33

27:                                               ; preds = %24
  %28 = add nuw nsw i32 %25, %3
  %29 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ9reductionPiS_E3tmp, i32 0, i32 %28
  %30 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !7
  %31 = load i32, i32 addrspace(3)* %15, align 4, !tbaa !7
  %32 = add nsw i32 %31, %30
  store i32 %32, i32 addrspace(3)* %15, align 4, !tbaa !7
  br label %33

33:                                               ; preds = %27, %24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %34 = lshr i32 %9, 3
  %35 = icmp ult i32 %3, %34
  br i1 %35, label %36, label %42

36:                                               ; preds = %33
  %37 = add nuw nsw i32 %34, %3
  %38 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ9reductionPiS_E3tmp, i32 0, i32 %37
  %39 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !7
  %40 = load i32, i32 addrspace(3)* %15, align 4, !tbaa !7
  %41 = add nsw i32 %40, %39
  store i32 %41, i32 addrspace(3)* %15, align 4, !tbaa !7
  br label %42

42:                                               ; preds = %36, %33
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = icmp eq i32 %3, 0
  br i1 %43, label %44, label %50

44:                                               ; preds = %42
  %45 = load i32, i32 addrspace(3)* getelementptr inbounds ([16 x i32], [16 x i32] addrspace(3)* @_ZZ9reductionPiS_E3tmp, i32 0, i32 1), align 4, !tbaa !7
  %46 = load i32, i32 addrspace(3)* %15, align 4, !tbaa !7
  %47 = add nsw i32 %46, %45
  store i32 %47, i32 addrspace(3)* %15, align 4, !tbaa !7
  %48 = zext i32 %4 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %48
  store i32 %47, i32 addrspace(1)* %49, align 4, !tbaa !7
  br label %50

50:                                               ; preds = %44, %42
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
