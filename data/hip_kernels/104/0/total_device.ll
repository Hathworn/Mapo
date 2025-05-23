; ModuleID = '../data/hip_kernels/104/0/main.cu'
source_filename = "../data/hip_kernels/104/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ5totalPfS_jE3sum = internal unnamed_addr addrspace(3) global [2048 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z5totalPfS_j(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = shl i32 %5, 1
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %4
  %14 = icmp ult i32 %4, %2
  br i1 %14, label %15, label %19

15:                                               ; preds = %3
  %16 = zext i32 %13 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %19

19:                                               ; preds = %3, %15
  %20 = phi contract float [ %18, %15 ], [ 0.000000e+00, %3 ]
  %21 = add i32 %13, %10
  %22 = icmp ult i32 %21, %2
  br i1 %22, label %23, label %28

23:                                               ; preds = %19
  %24 = zext i32 %21 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  %27 = fadd contract float %20, %26
  br label %28

28:                                               ; preds = %23, %19
  %29 = phi float [ %27, %23 ], [ %20, %19 ]
  %30 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ5totalPfS_jE3sum, i32 0, i32 %4
  store float %29, float addrspace(3)* %30, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = icmp ult i16 %9, 2
  br i1 %31, label %32, label %34

32:                                               ; preds = %44, %28
  %33 = icmp eq i32 %4, 0
  br i1 %33, label %47, label %51

34:                                               ; preds = %28, %44
  %35 = phi i32 [ %37, %44 ], [ %10, %28 ]
  %36 = phi float [ %45, %44 ], [ %29, %28 ]
  %37 = lshr i32 %35, 1
  %38 = icmp ult i32 %4, %37
  br i1 %38, label %39, label %44

39:                                               ; preds = %34
  %40 = add nuw nsw i32 %37, %4
  %41 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ5totalPfS_jE3sum, i32 0, i32 %40
  %42 = load float, float addrspace(3)* %41, align 4, !tbaa !7
  %43 = fadd contract float %36, %42
  store float %43, float addrspace(3)* %30, align 4, !tbaa !7
  br label %44

44:                                               ; preds = %39, %34
  %45 = phi float [ %43, %39 ], [ %36, %34 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %46 = icmp ult i32 %35, 4
  br i1 %46, label %32, label %34, !llvm.loop !11

47:                                               ; preds = %32
  %48 = load float, float addrspace(3)* getelementptr inbounds ([2048 x float], [2048 x float] addrspace(3)* @_ZZ5totalPfS_jE3sum, i32 0, i32 0), align 16, !tbaa !7
  %49 = zext i32 %5 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  store float %48, float addrspace(1)* %50, align 4, !tbaa !7
  br label %51

51:                                               ; preds = %47, %32
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
