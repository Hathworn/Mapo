; ModuleID = '../data/hip_kernels/2824/109/main.cu'
source_filename = "../data/hip_kernels/2824/109/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12shared4RMopsPfS_S_iE4Smem = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z12shared4RMopsPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %20

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  %19 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ12shared4RMopsPfS_S_iE4Smem, i32 0, i32 %12
  store float %18, float addrspace(3)* %19, align 4, !tbaa !7
  br label %20

20:                                               ; preds = %15, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %14, label %21, label %68

21:                                               ; preds = %20
  %22 = sext i32 %13 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %0, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = fpext float %24 to double
  %26 = fdiv contract double %25, 7.000000e+00
  %27 = fmul contract double %26, %25
  %28 = fptrunc double %27 to float
  %29 = fdiv contract float %24, 3.000000e+00
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %22
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = fmul contract float %31, 1.700000e+01
  %33 = fadd contract float %29, %32
  %34 = fmul contract float %31, 3.000000e+00
  %35 = fadd contract float %34, %33
  %36 = fmul contract float %24, %28
  %37 = fsub contract float %35, %36
  %38 = fmul contract float %31, %28
  %39 = fmul contract float %38, 7.000000e+00
  %40 = fadd contract float %37, %39
  %41 = fadd contract float %40, %28
  %42 = fadd contract float %41, -8.000000e+00
  %43 = add nuw nsw i32 %12, 1
  %44 = and i32 %43, 511
  %45 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ12shared4RMopsPfS_S_iE4Smem, i32 0, i32 %44
  %46 = load float, float addrspace(3)* %45, align 4, !tbaa !7
  %47 = fmul contract float %24, %46
  %48 = fadd contract float %47, %42
  %49 = add nuw nsw i32 %12, 2
  %50 = and i32 %49, 511
  %51 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ12shared4RMopsPfS_S_iE4Smem, i32 0, i32 %50
  %52 = load float, float addrspace(3)* %51, align 4, !tbaa !7
  %53 = fmul contract float %52, 4.000000e+00
  %54 = fadd contract float %53, %48
  %55 = add nuw nsw i32 %12, 3
  %56 = and i32 %55, 511
  %57 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ12shared4RMopsPfS_S_iE4Smem, i32 0, i32 %56
  %58 = load float, float addrspace(3)* %57, align 4, !tbaa !7
  %59 = fmul contract float %34, %58
  %60 = fadd contract float %59, %54
  %61 = add nuw nsw i32 %12, 4
  %62 = and i32 %61, 511
  %63 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ12shared4RMopsPfS_S_iE4Smem, i32 0, i32 %62
  %64 = load float, float addrspace(3)* %63, align 4, !tbaa !7
  %65 = fmul contract float %24, %64
  %66 = fadd contract float %65, %60
  %67 = getelementptr inbounds float, float addrspace(1)* %2, i64 %22
  store float %66, float addrspace(1)* %67, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %21, %20
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
