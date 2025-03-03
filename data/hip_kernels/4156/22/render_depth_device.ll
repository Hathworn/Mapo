; ModuleID = '../data/hip_kernels/4156/22/main.cu'
source_filename = "../data/hip_kernels/4156/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z12render_depthPfPj(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = shl i32 %3, 5
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = add i32 %4, %5
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = shl i32 %7, 5
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = add i32 %8, %9
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !5
  %15 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !14, !invariant.load !15
  %18 = zext i16 %17 to i32
  %19 = udiv i32 %14, %18
  %20 = mul i32 %19, %18
  %21 = icmp ugt i32 %14, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = shl i32 %23, 5
  %25 = ashr exact i32 %24, 1
  %26 = sitofp i32 %24 to double
  %27 = sitofp i32 %25 to double
  %28 = mul nsw i32 %10, %24
  %29 = add nsw i32 %6, %28
  %30 = mul nsw i32 %29, 3
  %31 = add nsw i32 %30, 1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %35 = fpext float %34 to double
  %36 = fadd contract double %35, 0x400921FB54442D18
  %37 = fdiv contract double %36, 0x401921FB54442D18
  %38 = fmul contract double %37, %26
  %39 = fadd contract double %38, -5.000000e-01
  %40 = tail call double @llvm.round.f64(double %39)
  %41 = fptosi double %40 to i32
  %42 = add nsw i32 %30, 2
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !16
  %46 = fpext float %45 to double
  %47 = fdiv contract double %46, 0x400921FB54442D18
  %48 = fmul contract double %47, %27
  %49 = fadd contract double %48, -5.000000e-01
  %50 = tail call double @llvm.round.f64(double %49)
  %51 = fptosi double %50 to i32
  %52 = sext i32 %30 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %55 = fmul contract float %54, 5.120000e+02
  %56 = fptosi float %55 to i32
  %57 = mul nsw i32 %24, %51
  %58 = add nsw i32 %57, %41
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %59
  %61 = atomicrmw umin i32 addrspace(1)* %60, i32 %56 syncscope("agent-one-as") monotonic, align 4
  %62 = add nsw i32 %10, 8
  %63 = mul nsw i32 %62, %24
  %64 = add nsw i32 %6, %63
  %65 = mul nsw i32 %64, 3
  %66 = add nsw i32 %65, 1
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !16
  %70 = fpext float %69 to double
  %71 = fadd contract double %70, 0x400921FB54442D18
  %72 = fdiv contract double %71, 0x401921FB54442D18
  %73 = fmul contract double %72, %26
  %74 = fadd contract double %73, -5.000000e-01
  %75 = tail call double @llvm.round.f64(double %74)
  %76 = fptosi double %75 to i32
  %77 = add nsw i32 %65, 2
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !16
  %81 = fpext float %80 to double
  %82 = fdiv contract double %81, 0x400921FB54442D18
  %83 = fmul contract double %82, %27
  %84 = fadd contract double %83, -5.000000e-01
  %85 = tail call double @llvm.round.f64(double %84)
  %86 = fptosi double %85 to i32
  %87 = sext i32 %65 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16
  %90 = fmul contract float %89, 5.120000e+02
  %91 = fptosi float %90 to i32
  %92 = mul nsw i32 %24, %86
  %93 = add nsw i32 %92, %76
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %94
  %96 = atomicrmw umin i32 addrspace(1)* %95, i32 %91 syncscope("agent-one-as") monotonic, align 4
  %97 = add nsw i32 %10, 16
  %98 = mul nsw i32 %97, %24
  %99 = add nsw i32 %6, %98
  %100 = mul nsw i32 %99, 3
  %101 = add nsw i32 %100, 1
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !16
  %105 = fpext float %104 to double
  %106 = fadd contract double %105, 0x400921FB54442D18
  %107 = fdiv contract double %106, 0x401921FB54442D18
  %108 = fmul contract double %107, %26
  %109 = fadd contract double %108, -5.000000e-01
  %110 = tail call double @llvm.round.f64(double %109)
  %111 = fptosi double %110 to i32
  %112 = add nsw i32 %100, 2
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !16
  %116 = fpext float %115 to double
  %117 = fdiv contract double %116, 0x400921FB54442D18
  %118 = fmul contract double %117, %27
  %119 = fadd contract double %118, -5.000000e-01
  %120 = tail call double @llvm.round.f64(double %119)
  %121 = fptosi double %120 to i32
  %122 = sext i32 %100 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !16
  %125 = fmul contract float %124, 5.120000e+02
  %126 = fptosi float %125 to i32
  %127 = mul nsw i32 %24, %121
  %128 = add nsw i32 %127, %111
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %129
  %131 = atomicrmw umin i32 addrspace(1)* %130, i32 %126 syncscope("agent-one-as") monotonic, align 4
  %132 = add nsw i32 %10, 24
  %133 = mul nsw i32 %132, %24
  %134 = add nsw i32 %6, %133
  %135 = mul nsw i32 %134, 3
  %136 = add nsw i32 %135, 1
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %0, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !16
  %140 = fpext float %139 to double
  %141 = fadd contract double %140, 0x400921FB54442D18
  %142 = fdiv contract double %141, 0x401921FB54442D18
  %143 = fmul contract double %142, %26
  %144 = fadd contract double %143, -5.000000e-01
  %145 = tail call double @llvm.round.f64(double %144)
  %146 = fptosi double %145 to i32
  %147 = add nsw i32 %135, 2
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %0, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !16
  %151 = fpext float %150 to double
  %152 = fdiv contract double %151, 0x400921FB54442D18
  %153 = fmul contract double %152, %27
  %154 = fadd contract double %153, -5.000000e-01
  %155 = tail call double @llvm.round.f64(double %154)
  %156 = fptosi double %155 to i32
  %157 = sext i32 %135 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %0, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !16
  %160 = fmul contract float %159, 5.120000e+02
  %161 = fptosi float %160 to i32
  %162 = mul nsw i32 %24, %156
  %163 = add nsw i32 %162, %146
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %164
  %166 = atomicrmw umin i32 addrspace(1)* %165, i32 %161 syncscope("agent-one-as") monotonic, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.round.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
