; ModuleID = '../data/hip_kernels/9391/11/main.cu'
source_filename = "../data/hip_kernels/9391/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14softmax_kernelllPKfPf(i64 %0, i64 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 2, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %5, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %15, %16
  %19 = mul i32 %18, %10
  %20 = add i32 %19, %17
  %21 = sext i32 %20 to i64
  %22 = icmp slt i64 %21, %0
  br i1 %22, label %23, label %91

23:                                               ; preds = %4
  %24 = mul nsw i64 %21, %1
  %25 = getelementptr inbounds float, float addrspace(1)* %2, i64 %24
  %26 = getelementptr inbounds float, float addrspace(1)* %3, i64 %24
  %27 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = icmp sgt i64 %1, 1
  br i1 %28, label %32, label %29

29:                                               ; preds = %32, %23
  %30 = phi float [ %27, %23 ], [ %37, %32 ]
  %31 = icmp sgt i64 %1, 0
  br i1 %31, label %43, label %41

32:                                               ; preds = %23, %32
  %33 = phi i64 [ %39, %32 ], [ 1, %23 ]
  %34 = phi float [ %37, %32 ], [ %27, %23 ]
  %35 = getelementptr inbounds float, float addrspace(1)* %25, i64 %33
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = tail call float @llvm.maxnum.f32(float %34, float %36)
  %38 = add nuw nsw i64 %33, 1
  %39 = and i64 %38, 4294967295
  %40 = icmp slt i64 %39, %1
  br i1 %40, label %32, label %29, !llvm.loop !11

41:                                               ; preds = %43, %29
  %42 = phi float [ 0.000000e+00, %29 ], [ %63, %43 ]
  br i1 %31, label %67, label %91

43:                                               ; preds = %29, %43
  %44 = phi i64 [ %65, %43 ], [ 0, %29 ]
  %45 = phi float [ %63, %43 ], [ 0.000000e+00, %29 ]
  %46 = getelementptr inbounds float, float addrspace(1)* %25, i64 %44
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = fsub contract float %47, %30
  %49 = fmul float %48, 0x3FF7154760000000
  %50 = tail call float @llvm.rint.f32(float %49)
  %51 = fcmp ogt float %48, 0x40562E4300000000
  %52 = fcmp olt float %48, 0xC059D1DA00000000
  %53 = fneg float %49
  %54 = tail call float @llvm.fma.f32(float %48, float 0x3FF7154760000000, float %53)
  %55 = tail call float @llvm.fma.f32(float %48, float 0x3E54AE0BE0000000, float %54)
  %56 = fsub float %49, %50
  %57 = fadd float %55, %56
  %58 = tail call float @llvm.exp2.f32(float %57)
  %59 = fptosi float %50 to i32
  %60 = tail call float @llvm.amdgcn.ldexp.f32(float %58, i32 %59)
  %61 = select i1 %52, float 0.000000e+00, float %60
  %62 = select i1 %51, float 0x7FF0000000000000, float %61
  %63 = fadd contract float %45, %62
  %64 = add nuw nsw i64 %44, 1
  %65 = and i64 %64, 4294967295
  %66 = icmp slt i64 %65, %1
  br i1 %66, label %43, label %41, !llvm.loop !13

67:                                               ; preds = %41, %67
  %68 = phi i64 [ %89, %67 ], [ 0, %41 ]
  %69 = getelementptr inbounds float, float addrspace(1)* %25, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = fsub contract float %70, %30
  %72 = fmul float %71, 0x3FF7154760000000
  %73 = tail call float @llvm.rint.f32(float %72)
  %74 = fcmp ogt float %71, 0x40562E4300000000
  %75 = fcmp olt float %71, 0xC059D1DA00000000
  %76 = fneg float %72
  %77 = tail call float @llvm.fma.f32(float %71, float 0x3FF7154760000000, float %76)
  %78 = tail call float @llvm.fma.f32(float %71, float 0x3E54AE0BE0000000, float %77)
  %79 = fsub float %72, %73
  %80 = fadd float %78, %79
  %81 = tail call float @llvm.exp2.f32(float %80)
  %82 = fptosi float %73 to i32
  %83 = tail call float @llvm.amdgcn.ldexp.f32(float %81, i32 %82)
  %84 = select i1 %75, float 0.000000e+00, float %83
  %85 = select i1 %74, float 0x7FF0000000000000, float %84
  %86 = fdiv contract float %85, %42
  %87 = getelementptr inbounds float, float addrspace(1)* %26, i64 %68
  store float %86, float addrspace(1)* %87, align 4, !tbaa !7
  %88 = add nuw nsw i64 %68, 1
  %89 = and i64 %88, 4294967295
  %90 = icmp slt i64 %89, %1
  br i1 %90, label %67, label %91, !llvm.loop !14

91:                                               ; preds = %67, %41, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
