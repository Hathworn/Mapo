; ModuleID = '../data/hip_kernels/10959/14/main.cu'
source_filename = "../data/hip_kernels/10959/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18updateGradInputLSMPKfS0_S0_PfS1_S1_S1_lli(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture readonly %6, i64 %7, i64 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = fadd contract float %20, -5.000000e-01
  %22 = fptosi float %21 to i32
  %23 = shl nsw i32 %22, 1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  %27 = fadd contract float %26, -5.000000e-01
  %28 = fptosi float %27 to i32
  %29 = sext i32 %28 to i64
  %30 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %36

32:                                               ; preds = %10
  %33 = mul nsw i64 %18, %8
  %34 = getelementptr inbounds float, float addrspace(1)* %5, i64 %33
  %35 = getelementptr inbounds float, float addrspace(1)* %34, i64 %29
  br label %51

36:                                               ; preds = %10
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 %29
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !6
  %39 = add nuw nsw i32 %23, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !6
  %43 = fadd contract float %38, 5.000000e-01
  %44 = fptosi float %43 to i32
  %45 = fadd contract float %42, -5.000000e-01
  %46 = fptosi float %45 to i32
  %47 = mul nsw i64 %18, %7
  %48 = getelementptr inbounds float, float addrspace(1)* %3, i64 %47
  %49 = sext i32 %46 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %48, i64 %49
  br label %51

51:                                               ; preds = %36, %32
  %52 = phi float addrspace(1)* [ %34, %32 ], [ %48, %36 ]
  %53 = phi float addrspace(1)* [ %6, %32 ], [ %4, %36 ]
  %54 = phi float addrspace(1)* [ %35, %32 ], [ %50, %36 ]
  %55 = phi i32 [ %9, %32 ], [ %44, %36 ]
  %56 = getelementptr inbounds float, float addrspace(1)* %53, i64 %18
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7
  %58 = icmp slt i32 %11, %55
  br i1 %58, label %61, label %59

59:                                               ; preds = %61, %51
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %60 = icmp eq i32 %11, 0
  br i1 %60, label %83, label %86

61:                                               ; preds = %51, %61
  %62 = phi i32 [ %81, %61 ], [ %11, %51 ]
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %52, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7
  %66 = fsub contract float %65, %57
  %67 = fmul float %66, 0x3FF7154760000000
  %68 = tail call float @llvm.rint.f32(float %67)
  %69 = fcmp ogt float %66, 0x40562E4300000000
  %70 = fcmp olt float %66, 0xC059D1DA00000000
  %71 = fneg float %67
  %72 = tail call float @llvm.fma.f32(float %66, float 0x3FF7154760000000, float %71)
  %73 = tail call float @llvm.fma.f32(float %66, float 0x3E54AE0BE0000000, float %72)
  %74 = fsub float %67, %68
  %75 = fadd float %73, %74
  %76 = tail call float @llvm.exp2.f32(float %75)
  %77 = fptosi float %68 to i32
  %78 = tail call float @llvm.amdgcn.ldexp.f32(float %76, i32 %77)
  %79 = select i1 %70, float 0.000000e+00, float %78
  %80 = select i1 %69, float 0x7FF0000000000000, float %79
  store float %80, float addrspace(1)* %64, align 4, !tbaa !7
  %81 = add nuw nsw i32 %62, %16
  %82 = icmp slt i32 %81, %55
  br i1 %82, label %61, label %59, !llvm.loop !11

83:                                               ; preds = %59
  %84 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %85 = fadd contract float %84, -1.000000e+00
  store float %85, float addrspace(1)* %54, align 4, !tbaa !7
  br label %86

86:                                               ; preds = %83, %59
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
