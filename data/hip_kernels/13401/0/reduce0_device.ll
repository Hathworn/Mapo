; ModuleID = '../data/hip_kernels/13401/0/main.cu'
source_filename = "../data/hip_kernels/13401/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ7reduce0PKfPfE6buffer = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7reduce0PKfPf(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7reduce0PKfPfE6buffer, i32 0, i32 %3
  %6 = mul i32 %4, 784
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  br label %14

12:                                               ; preds = %14
  store float %27, float addrspace(3)* %5, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %13 = icmp ugt i16 %10, 1
  br i1 %13, label %32, label %30

14:                                               ; preds = %2, %14
  %15 = phi i32 [ %3, %2 ], [ %28, %14 ]
  %16 = phi float [ 0.000000e+00, %2 ], [ %27, %14 ]
  %17 = freeze i32 %15
  %18 = udiv i32 %17, 784
  %19 = mul i32 %18, 784
  %20 = sub i32 %17, %19
  %21 = mul nuw nsw i32 %18, 802816
  %22 = add i32 %20, %6
  %23 = add i32 %22, %21
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  %27 = fadd contract float %26, %16
  %28 = add nuw nsw i32 %15, %11
  %29 = icmp ult i32 %28, 200704
  br i1 %29, label %14, label %12, !llvm.loop !11

30:                                               ; preds = %44, %12
  %31 = icmp eq i32 %3, 0
  br i1 %31, label %46, label %51

32:                                               ; preds = %12, %44
  %33 = phi i32 [ %34, %44 ], [ 1, %12 ]
  %34 = shl nsw i32 %33, 1
  %35 = add i32 %34, 1023
  %36 = and i32 %35, %3
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %44

38:                                               ; preds = %32
  %39 = add i32 %33, %3
  %40 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7reduce0PKfPfE6buffer, i32 0, i32 %39
  %41 = load float, float addrspace(3)* %40, align 4, !tbaa !7
  %42 = load float, float addrspace(3)* %5, align 4, !tbaa !7
  %43 = fadd contract float %41, %42
  store float %43, float addrspace(3)* %5, align 4, !tbaa !7
  br label %44

44:                                               ; preds = %38, %32
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = icmp ult i32 %34, %11
  br i1 %45, label %32, label %30, !llvm.loop !13

46:                                               ; preds = %30
  %47 = load float, float addrspace(3)* getelementptr inbounds ([512 x float], [512 x float] addrspace(3)* @_ZZ7reduce0PKfPfE6buffer, i32 0, i32 0), align 16, !tbaa !7
  %48 = fdiv contract float %47, 2.007040e+05
  %49 = zext i32 %4 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  store float %48, float addrspace(1)* %50, align 4, !tbaa !7
  br label %51

51:                                               ; preds = %46, %30
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
!13 = distinct !{!13, !12}
