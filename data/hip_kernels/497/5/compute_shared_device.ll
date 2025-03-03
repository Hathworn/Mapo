; ModuleID = '../data/hip_kernels/497/5/main.cu'
source_filename = "../data/hip_kernels/497/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ14compute_sharedPKiS0_S0_iPKfPfE10s_dest_off = internal unnamed_addr addrspace(3) global [1025 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14compute_sharedPKiS0_S0_iPKfPf(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %3
  br i1 %16, label %17, label %63

17:                                               ; preds = %6
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = getelementptr inbounds [1025 x i32], [1025 x i32] addrspace(3)* @_ZZ14compute_sharedPKiS0_S0_iPKfPfE10s_dest_off, i32 0, i32 %14
  store i32 %20, i32 addrspace(3)* %21, align 4, !tbaa !7
  %22 = icmp eq i32 %14, 1023
  %23 = add nsw i32 %3, -1
  %24 = icmp eq i32 %15, %23
  %25 = select i1 %22, i1 true, i1 %24
  br i1 %25, label %28, label %26

26:                                               ; preds = %17
  %27 = add nuw nsw i32 %14, 1
  br label %35

28:                                               ; preds = %17
  %29 = add nsw i32 %15, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  %33 = add nuw nsw i32 %14, 1
  %34 = getelementptr inbounds [1025 x i32], [1025 x i32] addrspace(3)* @_ZZ14compute_sharedPKiS0_S0_iPKfPfE10s_dest_off, i32 0, i32 %33
  store i32 %32, i32 addrspace(3)* %34, align 4, !tbaa !7
  br label %35

35:                                               ; preds = %26, %28
  %36 = phi i32 [ %27, %26 ], [ %33, %28 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !7
  %38 = getelementptr inbounds [1025 x i32], [1025 x i32] addrspace(3)* @_ZZ14compute_sharedPKiS0_S0_iPKfPfE10s_dest_off, i32 0, i32 %36
  %39 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !7
  %40 = icmp sgt i32 %39, %37
  br i1 %40, label %41, label %60

41:                                               ; preds = %35, %41
  %42 = phi float [ %55, %41 ], [ 0.000000e+00, %35 ]
  %43 = phi i32 [ %56, %41 ], [ %37, %35 ]
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %4, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !11, !amdgpu.noclobber !5
  %50 = fmul contract float %49, 0x3FEB333340000000
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %47
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = sitofp i32 %52 to float
  %54 = fdiv contract float %50, %53
  %55 = fadd contract float %42, %54
  %56 = add nsw i32 %43, 1
  %57 = icmp slt i32 %56, %39
  br i1 %57, label %41, label %58, !llvm.loop !13

58:                                               ; preds = %41
  %59 = fadd contract float %55, 0x3FC3333300000000
  br label %60

60:                                               ; preds = %58, %35
  %61 = phi float [ 0x3FC3333300000000, %35 ], [ %59, %58 ]
  %62 = getelementptr inbounds float, float addrspace(1)* %5, i64 %18
  store float %61, float addrspace(1)* %62, align 4, !tbaa !11
  br label %63

63:                                               ; preds = %60, %6
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

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
