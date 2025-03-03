; ModuleID = '../data/hip_kernels/348/1/main.cu'
source_filename = "../data/hip_kernels/348/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13r_initial_sumPfPiS_S_S_S_iE16shared_r_squared = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16
@_ZZ13r_initial_sumPfPiS_S_S_S_iE12shared_p_sum = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13r_initial_sumPfPiS_S_S_S_i(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readnone %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture writeonly %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13r_initial_sumPfPiS_S_S_S_iE16shared_r_squared, i32 0, i32 %15
  store float 0.000000e+00, float addrspace(3)* %17, align 4, !tbaa !7
  %18 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13r_initial_sumPfPiS_S_S_S_iE12shared_p_sum, i32 0, i32 %15
  store float 0.000000e+00, float addrspace(3)* %18, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %19 = icmp slt i32 %16, %6
  br i1 %19, label %20, label %61

20:                                               ; preds = %7
  %21 = mul nsw i32 %16, 3
  %22 = load float, float addrspace(3)* %18, align 4, !tbaa !7
  %23 = sext i32 %21 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %0, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !5
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %23
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !11, !amdgpu.noclobber !5
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %3, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = fmul contract float %25, %30
  %32 = fadd contract float %22, %31
  %33 = add nsw i32 %21, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %34
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !11, !amdgpu.noclobber !5
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %3, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = fmul contract float %36, %41
  %43 = fadd contract float %32, %42
  %44 = add nsw i32 %21, 2
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %45
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !11, !amdgpu.noclobber !5
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %3, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = fmul contract float %47, %52
  %54 = fadd contract float %43, %53
  store float %54, float addrspace(3)* %18, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %55 = sext i32 %16 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %3, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %58 = fmul contract float %57, %57
  store float %58, float addrspace(3)* %17, align 4, !tbaa !7
  %59 = load float, float addrspace(3)* %18, align 4, !tbaa !7
  %60 = fmul contract float %57, %59
  store float %60, float addrspace(3)* %18, align 4, !tbaa !7
  br label %61

61:                                               ; preds = %20, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %62 = icmp ult i16 %11, 2
  br i1 %62, label %63, label %65

63:                                               ; preds = %79, %61
  %64 = icmp eq i32 %15, 0
  br i1 %64, label %81, label %87

65:                                               ; preds = %61, %79
  %66 = phi i32 [ %67, %79 ], [ %12, %61 ]
  %67 = lshr i32 %66, 1
  %68 = icmp ult i32 %15, %67
  br i1 %68, label %69, label %79

69:                                               ; preds = %65
  %70 = load float, float addrspace(3)* %17, align 4, !tbaa !7
  %71 = add nuw nsw i32 %67, %15
  %72 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13r_initial_sumPfPiS_S_S_S_iE16shared_r_squared, i32 0, i32 %71
  %73 = load float, float addrspace(3)* %72, align 4, !tbaa !7
  %74 = fadd contract float %70, %73
  store float %74, float addrspace(3)* %17, align 4, !tbaa !7
  %75 = load float, float addrspace(3)* %18, align 4, !tbaa !7
  %76 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13r_initial_sumPfPiS_S_S_S_iE12shared_p_sum, i32 0, i32 %71
  %77 = load float, float addrspace(3)* %76, align 4, !tbaa !7
  %78 = fadd contract float %75, %77
  store float %78, float addrspace(3)* %18, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %79

79:                                               ; preds = %65, %69
  %80 = icmp ult i32 %66, 4
  br i1 %80, label %63, label %65, !llvm.loop !13

81:                                               ; preds = %63
  %82 = load float, float addrspace(3)* getelementptr inbounds ([1024 x float], [1024 x float] addrspace(3)* @_ZZ13r_initial_sumPfPiS_S_S_S_iE16shared_r_squared, i32 0, i32 0), align 16, !tbaa !7
  %83 = zext i32 %13 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %4, i64 %83
  store float %82, float addrspace(1)* %84, align 4, !tbaa !7
  %85 = load float, float addrspace(3)* getelementptr inbounds ([1024 x float], [1024 x float] addrspace(3)* @_ZZ13r_initial_sumPfPiS_S_S_S_iE12shared_p_sum, i32 0, i32 0), align 16, !tbaa !7
  %86 = getelementptr inbounds float, float addrspace(1)* %5, i64 %83
  store float %85, float addrspace(1)* %86, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %87

87:                                               ; preds = %81, %63
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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
