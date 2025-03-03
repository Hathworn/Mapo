; ModuleID = '../data/hip_kernels/13803/5/main.cu'
source_filename = "../data/hip_kernels/13803/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13reduce_fieldsPfS_S_S_S_S_S_S_iE9rho_array = internal unnamed_addr addrspace(3) global [1000 x float] undef, align 16
@_ZZ13reduce_fieldsPfS_S_S_S_S_S_S_iE8Ex_array = internal unnamed_addr addrspace(3) global [1000 x float] undef, align 16
@_ZZ13reduce_fieldsPfS_S_S_S_S_S_S_iE8Ey_array = internal unnamed_addr addrspace(3) global [1000 x float] undef, align 16
@_ZZ13reduce_fieldsPfS_S_S_S_S_S_S_iE8Ez_array = internal unnamed_addr addrspace(3) global [1000 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13reduce_fieldsPfS_S_S_S_S_S_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture writeonly %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %15, %14
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = icmp slt i32 %18, %8
  br i1 %19, label %20, label %67

20:                                               ; preds = %9
  %21 = icmp ult i16 %13, 2
  br i1 %21, label %27, label %22

22:                                               ; preds = %20
  %23 = getelementptr inbounds [1000 x float], [1000 x float] addrspace(3)* @_ZZ13reduce_fieldsPfS_S_S_S_S_S_S_iE9rho_array, i32 0, i32 %17
  %24 = getelementptr inbounds [1000 x float], [1000 x float] addrspace(3)* @_ZZ13reduce_fieldsPfS_S_S_S_S_S_S_iE8Ex_array, i32 0, i32 %17
  %25 = getelementptr inbounds [1000 x float], [1000 x float] addrspace(3)* @_ZZ13reduce_fieldsPfS_S_S_S_S_S_S_iE8Ey_array, i32 0, i32 %17
  %26 = getelementptr inbounds [1000 x float], [1000 x float] addrspace(3)* @_ZZ13reduce_fieldsPfS_S_S_S_S_S_S_iE8Ez_array, i32 0, i32 %17
  br label %29

27:                                               ; preds = %55, %20
  %28 = icmp eq i32 %17, 0
  br i1 %28, label %57, label %67

29:                                               ; preds = %22, %55
  %30 = phi i32 [ %14, %22 ], [ %31, %55 ]
  %31 = lshr i32 %30, 1
  %32 = icmp ult i32 %17, %31
  br i1 %32, label %33, label %55

33:                                               ; preds = %29
  %34 = add nuw nsw i32 %31, %17
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = load float, float addrspace(3)* %23, align 4, !tbaa !7
  %39 = fadd contract float %37, %38
  store float %39, float addrspace(3)* %23, align 4, !tbaa !7
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = fmul contract float %41, %41
  %43 = load float, float addrspace(3)* %24, align 4, !tbaa !7
  %44 = fadd contract float %43, %42
  store float %44, float addrspace(3)* %24, align 4, !tbaa !7
  %45 = getelementptr inbounds float, float addrspace(1)* %2, i64 %35
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = fmul contract float %46, %46
  %48 = load float, float addrspace(3)* %25, align 4, !tbaa !7
  %49 = fadd contract float %48, %47
  store float %49, float addrspace(3)* %25, align 4, !tbaa !7
  %50 = getelementptr inbounds float, float addrspace(1)* %3, i64 %35
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = fmul contract float %51, %51
  %53 = load float, float addrspace(3)* %26, align 4, !tbaa !7
  %54 = fadd contract float %53, %52
  store float %54, float addrspace(3)* %26, align 4, !tbaa !7
  br label %55

55:                                               ; preds = %33, %29
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %56 = icmp ult i32 %30, 4
  br i1 %56, label %27, label %29, !llvm.loop !11

57:                                               ; preds = %27
  %58 = load float, float addrspace(3)* getelementptr inbounds ([1000 x float], [1000 x float] addrspace(3)* @_ZZ13reduce_fieldsPfS_S_S_S_S_S_S_iE9rho_array, i32 0, i32 0), align 16, !tbaa !7
  %59 = zext i32 %15 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %4, i64 %59
  store float %58, float addrspace(1)* %60, align 4, !tbaa !7
  %61 = load float, float addrspace(3)* getelementptr inbounds ([1000 x float], [1000 x float] addrspace(3)* @_ZZ13reduce_fieldsPfS_S_S_S_S_S_S_iE8Ex_array, i32 0, i32 0), align 16, !tbaa !7
  %62 = getelementptr inbounds float, float addrspace(1)* %5, i64 %59
  store float %61, float addrspace(1)* %62, align 4, !tbaa !7
  %63 = load float, float addrspace(3)* getelementptr inbounds ([1000 x float], [1000 x float] addrspace(3)* @_ZZ13reduce_fieldsPfS_S_S_S_S_S_S_iE8Ey_array, i32 0, i32 0), align 16, !tbaa !7
  %64 = getelementptr inbounds float, float addrspace(1)* %6, i64 %59
  store float %63, float addrspace(1)* %64, align 4, !tbaa !7
  %65 = load float, float addrspace(3)* getelementptr inbounds ([1000 x float], [1000 x float] addrspace(3)* @_ZZ13reduce_fieldsPfS_S_S_S_S_S_S_iE8Ez_array, i32 0, i32 0), align 16, !tbaa !7
  %66 = getelementptr inbounds float, float addrspace(1)* %7, i64 %59
  store float %65, float addrspace(1)* %66, align 4, !tbaa !7
  br label %67

67:                                               ; preds = %27, %57, %9
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
