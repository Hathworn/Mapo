; ModuleID = '../data/hip_kernels/8783/1/main.cu'
source_filename = "../data/hip_kernels/8783/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z31bilateralOptimizedGpuColsKernelPfS_iijff(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, float %5, float %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %16, %3
  %26 = icmp slt i32 %24, %2
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %139

28:                                               ; preds = %7
  %29 = icmp eq i32 %4, 0
  br i1 %29, label %30, label %34

30:                                               ; preds = %28
  %31 = mul nsw i32 %24, %3
  %32 = add nsw i32 %31, %16
  %33 = sext i32 %32 to i64
  br label %53

34:                                               ; preds = %28
  %35 = lshr i32 %4, 1
  %36 = mul nsw i32 %24, %3
  %37 = add nsw i32 %36, %16
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = fmul contract float %6, 2.000000e+00
  %42 = fmul contract float %41, %6
  %43 = fpext float %6 to double
  %44 = fmul contract double %43, 0x401921FB54442D18
  %45 = fmul contract double %44, %43
  %46 = fmul contract float %5, 2.000000e+00
  %47 = fmul contract float %46, %5
  %48 = fpext float %5 to double
  %49 = fmul contract double %48, 0x401921FB54442D18
  %50 = fmul contract double %49, %48
  br label %57

51:                                               ; preds = %57
  %52 = fdiv contract float %135, %136
  br label %53

53:                                               ; preds = %30, %51
  %54 = phi i64 [ %33, %30 ], [ %38, %51 ]
  %55 = phi float [ 0x7FF8000000000000, %30 ], [ %52, %51 ]
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  store float %55, float addrspace(1)* %56, align 4, !tbaa !7
  br label %139

57:                                               ; preds = %34, %57
  %58 = phi i32 [ 0, %34 ], [ %137, %57 ]
  %59 = phi float [ 0.000000e+00, %34 ], [ %135, %57 ]
  %60 = phi float [ 0.000000e+00, %34 ], [ %136, %57 ]
  %61 = add nuw i32 %35, %58
  %62 = sub i32 %16, %61
  %63 = tail call i32 @llvm.smax.i32(i32 %62, i32 0)
  %64 = add nsw i32 %63, %36
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = fsub contract float %67, %40
  %69 = fneg contract float %68
  %70 = fmul contract float %68, %69
  %71 = fdiv contract float %70, %42
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
  %86 = fpext float %85 to double
  %87 = fdiv contract double %86, %45
  %88 = fptrunc double %87 to float
  %89 = sub nsw i32 %16, %63
  %90 = mul nsw i32 %89, %89
  %91 = sitofp i32 %90 to float
  %92 = icmp eq i32 %16, %63
  %93 = select i1 %92, float 0x41F0000000000000, float 1.000000e+00
  %94 = fmul float %93, %91
  %95 = tail call float @llvm.sqrt.f32(float %94)
  %96 = bitcast float %95 to i32
  %97 = add nsw i32 %96, -1
  %98 = bitcast i32 %97 to float
  %99 = add nsw i32 %96, 1
  %100 = bitcast i32 %99 to float
  %101 = tail call i1 @llvm.amdgcn.class.f32(float %94, i32 608)
  %102 = select i1 %92, float 0x3EF0000000000000, float 1.000000e+00
  %103 = fneg float %100
  %104 = tail call float @llvm.fma.f32(float %103, float %95, float %94)
  %105 = fcmp ogt float %104, 0.000000e+00
  %106 = fneg float %98
  %107 = tail call float @llvm.fma.f32(float %106, float %95, float %94)
  %108 = fcmp ole float %107, 0.000000e+00
  %109 = select i1 %108, float %98, float %95
  %110 = select i1 %105, float %100, float %109
  %111 = fmul float %102, %110
  %112 = select i1 %101, float %94, float %111
  %113 = fneg contract float %112
  %114 = fmul contract float %112, %113
  %115 = fdiv contract float %114, %47
  %116 = fmul float %115, 0x3FF7154760000000
  %117 = tail call float @llvm.rint.f32(float %116)
  %118 = fcmp ogt float %115, 0x40562E4300000000
  %119 = fcmp olt float %115, 0xC059D1DA00000000
  %120 = fneg float %116
  %121 = tail call float @llvm.fma.f32(float %115, float 0x3FF7154760000000, float %120)
  %122 = tail call float @llvm.fma.f32(float %115, float 0x3E54AE0BE0000000, float %121)
  %123 = fsub float %116, %117
  %124 = fadd float %122, %123
  %125 = tail call float @llvm.exp2.f32(float %124)
  %126 = fptosi float %117 to i32
  %127 = tail call float @llvm.amdgcn.ldexp.f32(float %125, i32 %126)
  %128 = select i1 %119, float 0.000000e+00, float %127
  %129 = select i1 %118, float 0x7FF0000000000000, float %128
  %130 = fpext float %129 to double
  %131 = fdiv contract double %130, %50
  %132 = fptrunc double %131 to float
  %133 = fmul contract float %132, %88
  %134 = fmul contract float %67, %133
  %135 = fadd contract float %59, %134
  %136 = fadd contract float %60, %133
  %137 = add nuw nsw i32 %58, 1
  %138 = icmp eq i32 %137, %4
  br i1 %138, label %51, label %57, !llvm.loop !11

139:                                              ; preds = %7, %53
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
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.enable"}
