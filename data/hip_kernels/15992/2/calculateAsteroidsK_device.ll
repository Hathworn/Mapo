; ModuleID = '../data/hip_kernels/15992/2/main.cu'
source_filename = "../data/hip_kernels/15992/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.asteroid = type { float, float, float, float }
%struct.blackHole = type { float, float, float }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19calculateAsteroidsKP8asteroidiP9blackHoleif(%struct.asteroid addrspace(1)* nocapture %0, i32 %1, %struct.blackHole addrspace(1)* nocapture readonly %2, i32 %3, float %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %17 = add i32 %15, %16
  %18 = udiv i32 %14, %11
  %19 = mul i32 %18, %11
  %20 = icmp ugt i32 %14, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %11
  %24 = icmp slt i32 %17, %1
  br i1 %24, label %25, label %34

25:                                               ; preds = %5
  %26 = icmp sgt i32 %3, 0
  br label %27

27:                                               ; preds = %25, %86
  %28 = phi i32 [ %17, %25 ], [ %137, %86 ]
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds %struct.asteroid, %struct.asteroid addrspace(1)* %0, i64 %29, i32 0
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !16
  %32 = getelementptr inbounds %struct.asteroid, %struct.asteroid addrspace(1)* %0, i64 %29, i32 1
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !21
  br i1 %26, label %35, label %86

34:                                               ; preds = %86, %5
  ret void

35:                                               ; preds = %27, %80
  %36 = phi float [ %82, %80 ], [ 0.000000e+00, %27 ]
  %37 = phi float [ %81, %80 ], [ 0.000000e+00, %27 ]
  %38 = phi i32 [ %83, %80 ], [ 0, %27 ]
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds %struct.blackHole, %struct.blackHole addrspace(1)* %2, i64 %39, i32 0
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !22, !amdgpu.noclobber !5
  %42 = fsub contract float %31, %41
  %43 = getelementptr inbounds %struct.blackHole, %struct.blackHole addrspace(1)* %2, i64 %39, i32 1
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !24, !amdgpu.noclobber !5
  %45 = fsub contract float %33, %44
  %46 = fcmp contract une float %42, 0.000000e+00
  %47 = fcmp contract une float %45, 0.000000e+00
  %48 = select i1 %46, i1 %47, i1 false
  br i1 %48, label %49, label %80

49:                                               ; preds = %35
  %50 = fmul contract float %42, %42
  %51 = fmul contract float %45, %45
  %52 = fadd contract float %50, %51
  %53 = fmul contract float %52, %52
  %54 = fcmp olt float %53, 0x39F0000000000000
  %55 = select i1 %54, float 0x41F0000000000000, float 1.000000e+00
  %56 = fmul float %53, %55
  %57 = tail call float @llvm.sqrt.f32(float %56)
  %58 = bitcast float %57 to i32
  %59 = add nsw i32 %58, -1
  %60 = bitcast i32 %59 to float
  %61 = add nsw i32 %58, 1
  %62 = bitcast i32 %61 to float
  %63 = tail call i1 @llvm.amdgcn.class.f32(float %56, i32 608)
  %64 = select i1 %54, float 0x3EF0000000000000, float 1.000000e+00
  %65 = fneg float %62
  %66 = tail call float @llvm.fma.f32(float %65, float %57, float %56)
  %67 = fcmp ogt float %66, 0.000000e+00
  %68 = fneg float %60
  %69 = tail call float @llvm.fma.f32(float %68, float %57, float %56)
  %70 = fcmp ole float %69, 0.000000e+00
  %71 = select i1 %70, float %60, float %57
  %72 = select i1 %67, float %62, float %71
  %73 = fmul float %64, %72
  %74 = select i1 %63, float %56, float %73
  %75 = fdiv contract float 1.000000e+00, %74
  %76 = fmul contract float %42, %75
  %77 = fadd contract float %36, %76
  %78 = fmul contract float %45, %75
  %79 = fadd contract float %37, %78
  br label %80

80:                                               ; preds = %35, %49
  %81 = phi float [ %79, %49 ], [ %37, %35 ]
  %82 = phi float [ %77, %49 ], [ %36, %35 ]
  %83 = add nuw nsw i32 %38, 1
  %84 = icmp slt i32 %83, %3
  %85 = select i1 %48, i1 %84, i1 false
  br i1 %85, label %35, label %86, !llvm.loop !25

86:                                               ; preds = %80, %27
  %87 = phi float [ 0.000000e+00, %27 ], [ %81, %80 ]
  %88 = phi float [ 0.000000e+00, %27 ], [ %82, %80 ]
  %89 = fmul contract float %88, %88
  %90 = fmul contract float %87, %87
  %91 = fadd contract float %90, %89
  %92 = fcmp olt float %91, 0x39F0000000000000
  %93 = select i1 %92, float 0x41F0000000000000, float 1.000000e+00
  %94 = fmul float %91, %93
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
  %113 = fneg contract float %88
  %114 = fdiv contract float %113, %112
  %115 = fmul contract float %114, %4
  %116 = getelementptr inbounds %struct.asteroid, %struct.asteroid addrspace(1)* %0, i64 %29, i32 2
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !27
  %118 = fadd contract float %117, %115
  store float %118, float addrspace(1)* %116, align 4, !tbaa !27
  %119 = fneg contract float %87
  %120 = fdiv contract float %119, %112
  %121 = fmul contract float %120, %4
  %122 = getelementptr inbounds %struct.asteroid, %struct.asteroid addrspace(1)* %0, i64 %29, i32 3
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !28
  %124 = fadd contract float %123, %121
  store float %124, float addrspace(1)* %122, align 4, !tbaa !28
  %125 = fpext float %118 to double
  %126 = fmul contract double %125, 1.000000e-02
  %127 = getelementptr inbounds %struct.asteroid, %struct.asteroid addrspace(1)* %0, i64 %29, i32 0
  %128 = fpext float %31 to double
  %129 = fadd contract double %126, %128
  %130 = fptrunc double %129 to float
  store float %130, float addrspace(1)* %127, align 4, !tbaa !16
  %131 = fpext float %124 to double
  %132 = fmul contract double %131, 1.000000e-02
  %133 = getelementptr inbounds %struct.asteroid, %struct.asteroid addrspace(1)* %0, i64 %29, i32 1
  %134 = fpext float %33 to double
  %135 = fadd contract double %132, %134
  %136 = fptrunc double %135 to float
  store float %136, float addrspace(1)* %133, align 4, !tbaa !21
  %137 = add nsw i32 %28, %23
  %138 = icmp slt i32 %137, %1
  br i1 %138, label %27, label %34, !llvm.loop !29
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!16 = !{!17, !18, i64 0}
!17 = !{!"_ZTS8asteroid", !18, i64 0, !18, i64 4, !18, i64 8, !18, i64 12}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{!17, !18, i64 4}
!22 = !{!23, !18, i64 0}
!23 = !{!"_ZTS9blackHole", !18, i64 0, !18, i64 4, !18, i64 8}
!24 = !{!23, !18, i64 4}
!25 = distinct !{!25, !26}
!26 = !{!"llvm.loop.mustprogress"}
!27 = !{!17, !18, i64 8}
!28 = !{!17, !18, i64 12}
!29 = distinct !{!29, !26}
