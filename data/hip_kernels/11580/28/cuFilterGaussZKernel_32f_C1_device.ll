; ModuleID = '../data/hip_kernels/11580/28/main.cu'
source_filename = "../data/hip_kernels/11580/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z27cuFilterGaussZKernel_32f_C1PfS_iiimmfi(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i64 %5, i64 %6, float %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = add i32 %24, %25
  %27 = icmp sgt i32 %18, -1
  %28 = icmp sgt i32 %26, -1
  %29 = select i1 %27, i1 %28, i1 false
  %30 = icmp slt i32 %18, %3
  %31 = select i1 %29, i1 %30, i1 false
  %32 = icmp slt i32 %26, %4
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %111

34:                                               ; preds = %9
  %35 = fmul contract float %7, 0x40040D9320000000
  %36 = fdiv contract float 1.000000e+00, %35
  %37 = fmul contract float %7, %7
  %38 = fdiv contract float -5.000000e-01, %37
  %39 = fmul float %38, 0x3FF7154760000000
  %40 = tail call float @llvm.rint.f32(float %39)
  %41 = fcmp ogt float %38, 0x40562E4300000000
  %42 = fcmp olt float %38, 0xC059D1DA00000000
  %43 = fneg float %39
  %44 = tail call float @llvm.fma.f32(float %38, float 0x3FF7154760000000, float %43)
  %45 = tail call float @llvm.fma.f32(float %38, float 0x3E54AE0BE0000000, float %44)
  %46 = fsub float %39, %40
  %47 = fadd float %45, %46
  %48 = tail call float @llvm.exp2.f32(float %47)
  %49 = fptosi float %40 to i32
  %50 = tail call float @llvm.amdgcn.ldexp.f32(float %48, i32 %49)
  %51 = select i1 %42, float 0.000000e+00, float %50
  %52 = select i1 %41, float 0x7FF0000000000000, float %51
  %53 = fmul contract float %52, %52
  %54 = zext i32 %26 to i64
  %55 = mul i64 %54, %6
  %56 = sext i32 %2 to i64
  %57 = mul i64 %56, %5
  %58 = zext i32 %18 to i64
  %59 = add i64 %57, %58
  %60 = add i64 %59, %55
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = fmul contract float %36, %62
  %64 = icmp slt i32 %8, 3
  br i1 %64, label %70, label %65

65:                                               ; preds = %34
  %66 = add nsw i32 %8, -1
  %67 = lshr i32 %66, 1
  %68 = add nsw i32 %4, -1
  %69 = sitofp i32 %68 to float
  br label %75

70:                                               ; preds = %75, %34
  %71 = phi float [ %36, %34 ], [ %108, %75 ]
  %72 = phi float [ %63, %34 ], [ %106, %75 ]
  %73 = fdiv contract float %72, %71
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  store float %73, float addrspace(1)* %74, align 4, !tbaa !7
  br label %111

75:                                               ; preds = %65, %75
  %76 = phi float [ %63, %65 ], [ %106, %75 ]
  %77 = phi i32 [ 1, %65 ], [ %109, %75 ]
  %78 = phi float [ %36, %65 ], [ %108, %75 ]
  %79 = phi float [ %36, %65 ], [ %81, %75 ]
  %80 = phi float [ %52, %65 ], [ %82, %75 ]
  %81 = fmul contract float %80, %79
  %82 = fmul contract float %53, %80
  %83 = add nsw i32 %77, %26
  %84 = sitofp i32 %83 to float
  %85 = tail call float @llvm.minnum.f32(float %69, float %84)
  %86 = tail call float @llvm.maxnum.f32(float %85, float 0.000000e+00)
  %87 = fptosi float %86 to i32
  %88 = sext i32 %87 to i64
  %89 = mul i64 %88, %6
  %90 = add i64 %59, %89
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !5
  %93 = fmul contract float %81, %92
  %94 = fadd contract float %76, %93
  %95 = sub nsw i32 %26, %77
  %96 = sitofp i32 %95 to float
  %97 = tail call float @llvm.minnum.f32(float %69, float %96)
  %98 = tail call float @llvm.maxnum.f32(float %97, float 0.000000e+00)
  %99 = fptosi float %98 to i32
  %100 = sext i32 %99 to i64
  %101 = mul i64 %100, %6
  %102 = add i64 %59, %101
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !5
  %105 = fmul contract float %81, %104
  %106 = fadd contract float %94, %105
  %107 = fmul contract float %81, 2.000000e+00
  %108 = fadd contract float %78, %107
  %109 = add nuw nsw i32 %77, 1
  %110 = icmp eq i32 %77, %67
  br i1 %110, label %70, label %75, !llvm.loop !11

111:                                              ; preds = %70, %9
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
