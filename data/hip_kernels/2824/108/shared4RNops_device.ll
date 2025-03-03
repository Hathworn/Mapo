; ModuleID = '../data/hip_kernels/2824/108/main.cu'
source_filename = "../data/hip_kernels/2824/108/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12shared4RNopsPfS_S_iE4Smem = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z12shared4RNopsPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
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
  %19 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ12shared4RNopsPfS_S_iE4Smem, i32 0, i32 %12
  store float %18, float addrspace(3)* %19, align 4, !tbaa !7
  br label %20

20:                                               ; preds = %15, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %14, label %21, label %87

21:                                               ; preds = %20
  %22 = sext i32 %13 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %0, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = fmul contract float %24, 2.500000e-01
  %26 = getelementptr inbounds float, float addrspace(1)* %1, i64 %22
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = fmul contract float %27, 1.500000e+01
  %29 = fadd contract float %25, %28
  %30 = fpext float %29 to double
  %31 = fpext float %24 to double
  %32 = fdiv contract double %31, 7.000000e+00
  %33 = fmul contract double %32, %31
  %34 = fsub contract double %30, %33
  %35 = fmul contract float %27, 4.000000e+00
  %36 = fpext float %35 to double
  %37 = fadd contract double %34, %36
  %38 = fmul contract float %24, 7.000000e+00
  %39 = fmul contract float %24, %38
  %40 = fpext float %39 to double
  %41 = fadd contract double %37, %40
  %42 = fmul contract float %24, %27
  %43 = fmul contract float %42, 7.000000e+00
  %44 = fpext float %43 to double
  %45 = fadd contract double %41, %44
  %46 = fptrunc double %45 to float
  %47 = fdiv contract float %24, 3.000000e+00
  %48 = fmul contract float %27, 1.700000e+01
  %49 = fadd contract float %47, %48
  %50 = fmul contract float %24, %24
  %51 = fsub contract float %49, %50
  %52 = fmul contract float %27, 3.000000e+00
  %53 = fadd contract float %52, %51
  %54 = fmul contract float %24, 4.000000e+00
  %55 = fmul contract float %54, %46
  %56 = fsub contract float %53, %55
  %57 = fmul contract float %27, %46
  %58 = fmul contract float %57, 7.000000e+00
  %59 = fadd contract float %56, %58
  %60 = fadd contract float %59, %46
  %61 = fadd contract float %60, -8.000000e+00
  %62 = add nuw nsw i32 %12, 1
  %63 = and i32 %62, 511
  %64 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ12shared4RNopsPfS_S_iE4Smem, i32 0, i32 %63
  %65 = load float, float addrspace(3)* %64, align 4, !tbaa !7
  %66 = fmul contract float %24, %65
  %67 = fadd contract float %66, %61
  %68 = add nuw nsw i32 %12, 2
  %69 = and i32 %68, 511
  %70 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ12shared4RNopsPfS_S_iE4Smem, i32 0, i32 %69
  %71 = load float, float addrspace(3)* %70, align 4, !tbaa !7
  %72 = fmul contract float %71, 4.000000e+00
  %73 = fadd contract float %72, %67
  %74 = add nuw nsw i32 %12, 3
  %75 = and i32 %74, 511
  %76 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ12shared4RNopsPfS_S_iE4Smem, i32 0, i32 %75
  %77 = load float, float addrspace(3)* %76, align 4, !tbaa !7
  %78 = fmul contract float %52, %77
  %79 = fadd contract float %78, %73
  %80 = add nuw nsw i32 %12, 4
  %81 = and i32 %80, 511
  %82 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ12shared4RNopsPfS_S_iE4Smem, i32 0, i32 %81
  %83 = load float, float addrspace(3)* %82, align 4, !tbaa !7
  %84 = fmul contract float %24, %83
  %85 = fadd contract float %84, %79
  %86 = getelementptr inbounds float, float addrspace(1)* %2, i64 %22
  store float %85, float addrspace(1)* %86, align 4, !tbaa !7
  br label %87

87:                                               ; preds = %21, %20
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
