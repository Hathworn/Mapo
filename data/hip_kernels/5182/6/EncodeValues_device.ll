; ModuleID = '../data/hip_kernels/5182/6/main.cu'
source_filename = "../data/hip_kernels/5182/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12EncodeValuesPfiS_iiS_S_S_S_S_S_E8s_values = internal unnamed_addr addrspace(3) global [2 x float] undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z12EncodeValuesPfiS_iiS_S_S_S_S_S_(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10) local_unnamed_addr #0 {
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !6
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = udiv i32 %19, %16
  %23 = mul i32 %22, %16
  %24 = icmp ugt i32 %19, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %21
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %29 = add i32 %27, %20
  %30 = mul i32 %29, %16
  %31 = add i32 %30, %28
  %32 = icmp ult i32 %28, 2
  br i1 %32, label %33, label %42

33:                                               ; preds = %11
  %34 = icmp eq i32 %4, 1
  %35 = zext i32 %28 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %38 = tail call float @llvm.minnum.f32(float %37, float 1.000000e+00)
  %39 = tail call float @llvm.maxnum.f32(float %38, float -1.000000e+00)
  %40 = select i1 %34, float %39, float %37
  %41 = getelementptr inbounds [2 x float], [2 x float] addrspace(3)* @_ZZ12EncodeValuesPfiS_iiS_S_S_S_S_S_E8s_values, i32 0, i32 %28
  store float %40, float addrspace(3)* %41, align 4, !tbaa !16
  br label %42

42:                                               ; preds = %33, %11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = icmp slt i32 %31, %3
  br i1 %43, label %44, label %96

44:                                               ; preds = %42
  %45 = load float, float addrspace(3)* getelementptr inbounds ([2 x float], [2 x float] addrspace(3)* @_ZZ12EncodeValuesPfiS_iiS_S_S_S_S_S_E8s_values, i32 0, i32 0), align 4, !tbaa !16
  %46 = fcmp contract ogt float %45, 0.000000e+00
  %47 = select i1 %46, float addrspace(1)* %5, float addrspace(1)* %7
  %48 = sext i32 %31 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %9, i64 %48
  %50 = getelementptr inbounds float, float addrspace(1)* %47, i64 %48
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  %52 = icmp eq i32 %4, 1
  %53 = tail call float @llvm.fabs.f32(float %45)
  %54 = fsub contract float 1.000000e+00, %53
  br i1 %52, label %55, label %62

55:                                               ; preds = %44
  %56 = fmul contract float %54, %54
  %57 = load float, float addrspace(1)* %49, align 4, !tbaa !16, !amdgpu.noclobber !5
  %58 = fmul contract float %56, %57
  store float %58, float addrspace(1)* %51, align 4, !tbaa !16
  %59 = fmul contract float %53, 2.000000e+00
  %60 = fmul contract float %45, %45
  %61 = fsub contract float %59, %60
  br label %65

62:                                               ; preds = %44
  %63 = load float, float addrspace(1)* %49, align 4, !tbaa !16, !amdgpu.noclobber !5
  %64 = fmul contract float %54, %63
  store float %64, float addrspace(1)* %51, align 4, !tbaa !16
  br label %65

65:                                               ; preds = %55, %62
  %66 = phi float [ %53, %62 ], [ %61, %55 ]
  %67 = phi float [ %64, %62 ], [ %58, %55 ]
  %68 = load float, float addrspace(1)* %50, align 4, !tbaa !16
  %69 = fmul contract float %66, %68
  %70 = fadd contract float %67, %69
  store float %70, float addrspace(1)* %51, align 4, !tbaa !16
  %71 = icmp sgt i32 %1, 1
  br i1 %71, label %72, label %96

72:                                               ; preds = %65
  %73 = load float, float addrspace(3)* getelementptr inbounds ([2 x float], [2 x float] addrspace(3)* @_ZZ12EncodeValuesPfiS_iiS_S_S_S_S_S_E8s_values, i32 0, i32 1), align 4, !tbaa !16
  %74 = fcmp contract ogt float %73, 0.000000e+00
  %75 = select i1 %74, float addrspace(1)* %6, float addrspace(1)* %8
  %76 = getelementptr inbounds float, float addrspace(1)* %10, i64 %48
  %77 = getelementptr inbounds float, float addrspace(1)* %75, i64 %48
  %78 = tail call float @llvm.fabs.f32(float %73)
  %79 = fsub contract float 1.000000e+00, %78
  br i1 %52, label %80, label %87

80:                                               ; preds = %72
  %81 = fmul contract float %79, %79
  %82 = load float, float addrspace(1)* %76, align 4, !tbaa !16
  %83 = fmul contract float %81, %82
  store float %83, float addrspace(1)* %51, align 4, !tbaa !16
  %84 = fmul contract float %78, 2.000000e+00
  %85 = fmul contract float %73, %73
  %86 = fsub contract float %84, %85
  br label %90

87:                                               ; preds = %72
  %88 = load float, float addrspace(1)* %76, align 4, !tbaa !16
  %89 = fmul contract float %79, %88
  store float %89, float addrspace(1)* %51, align 4, !tbaa !16
  br label %90

90:                                               ; preds = %80, %87
  %91 = phi float [ %78, %87 ], [ %86, %80 ]
  %92 = phi float [ %89, %87 ], [ %83, %80 ]
  %93 = load float, float addrspace(1)* %77, align 4, !tbaa !16
  %94 = fmul contract float %91, %93
  %95 = fadd contract float %92, %94
  store float %95, float addrspace(1)* %51, align 4, !tbaa !16
  br label %96

96:                                               ; preds = %65, %90, %42
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
