; ModuleID = '../data/hip_kernels/9308/98/main.cu'
source_filename = "../data/hip_kernels/9308/98/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z24ForwardWarpKernel_PSF2x2PKfS0_S0_iiiifPfS1_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, float %7, float addrspace(1)* nocapture %8, float addrspace(1)* nocapture %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = add i32 %18, %11
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !5, !invariant.load !6
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = add i32 %26, %20
  %28 = icmp slt i32 %27, %4
  %29 = icmp slt i32 %19, %3
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %145

31:                                               ; preds = %10
  %32 = mul nsw i32 %27, %5
  %33 = mul nsw i32 %27, %6
  %34 = add nsw i32 %32, %19
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !6
  %38 = fmul contract float %37, %7
  %39 = sitofp i32 %19 to float
  %40 = fadd contract float %38, %39
  %41 = fadd contract float %40, 1.000000e+00
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  %44 = fmul contract float %43, %7
  %45 = sitofp i32 %27 to float
  %46 = fadd contract float %44, %45
  %47 = fadd contract float %46, 1.000000e+00
  %48 = tail call float @llvm.trunc.f32(float %41)
  %49 = fsub float %41, %48
  %50 = tail call float @llvm.fabs.f32(float %41) #3
  %51 = fcmp oeq float %50, 0x7FF0000000000000
  %52 = select i1 %51, float 0.000000e+00, float %49
  %53 = tail call float @llvm.copysign.f32(float %52, float %41)
  %54 = tail call float @llvm.trunc.f32(float %47)
  %55 = fsub float %47, %54
  %56 = tail call float @llvm.fabs.f32(float %47) #3
  %57 = fcmp oeq float %56, 0x7FF0000000000000
  %58 = select i1 %57, float 0.000000e+00, float %55
  %59 = tail call float @llvm.copysign.f32(float %58, float %47)
  %60 = fptosi float %48 to i32
  %61 = fptosi float %54 to i32
  %62 = add nsw i32 %33, %19
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %2, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !6
  %66 = icmp sge i32 %60, %3
  %67 = icmp slt i32 %60, 0
  %68 = or i1 %66, %67
  br i1 %68, label %85, label %69

69:                                               ; preds = %31
  %70 = icmp sge i32 %61, %4
  %71 = icmp slt i32 %61, 0
  %72 = or i1 %70, %71
  br i1 %72, label %85, label %73

73:                                               ; preds = %69
  %74 = fmul contract float %53, %59
  %75 = mul nsw i32 %61, %6
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %9, i64 %76
  %78 = zext i32 %60 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %77, i64 %78
  %80 = fmul contract float %65, %74
  %81 = atomicrmw fadd float addrspace(1)* %79, float %80 syncscope("agent-one-as") monotonic, align 4
  %82 = getelementptr inbounds float, float addrspace(1)* %8, i64 %76
  %83 = getelementptr inbounds float, float addrspace(1)* %82, i64 %78
  %84 = atomicrmw fadd float addrspace(1)* %83, float %74 syncscope("agent-one-as") monotonic, align 4
  br label %85

85:                                               ; preds = %73, %69, %31
  %86 = add nsw i32 %60, -1
  %87 = icmp sgt i32 %60, %3
  %88 = icmp slt i32 %60, 1
  %89 = or i1 %87, %88
  br i1 %89, label %107, label %90

90:                                               ; preds = %85
  %91 = icmp sge i32 %61, %4
  %92 = icmp slt i32 %61, 0
  %93 = or i1 %91, %92
  br i1 %93, label %107, label %94

94:                                               ; preds = %90
  %95 = fsub contract float 1.000000e+00, %53
  %96 = fmul contract float %95, %59
  %97 = mul nsw i32 %61, %6
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %9, i64 %98
  %100 = zext i32 %86 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %99, i64 %100
  %102 = fmul contract float %65, %96
  %103 = atomicrmw fadd float addrspace(1)* %101, float %102 syncscope("agent-one-as") monotonic, align 4
  %104 = getelementptr inbounds float, float addrspace(1)* %8, i64 %98
  %105 = getelementptr inbounds float, float addrspace(1)* %104, i64 %100
  %106 = atomicrmw fadd float addrspace(1)* %105, float %96 syncscope("agent-one-as") monotonic, align 4
  br label %107

107:                                              ; preds = %94, %90, %85
  %108 = add nsw i32 %61, -1
  br i1 %89, label %127, label %109

109:                                              ; preds = %107
  %110 = icmp sgt i32 %61, %4
  %111 = icmp slt i32 %61, 1
  %112 = or i1 %110, %111
  br i1 %112, label %127, label %113

113:                                              ; preds = %109
  %114 = fsub contract float 1.000000e+00, %53
  %115 = fsub contract float 1.000000e+00, %59
  %116 = fmul contract float %114, %115
  %117 = mul nsw i32 %108, %6
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %9, i64 %118
  %120 = zext i32 %86 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %119, i64 %120
  %122 = fmul contract float %65, %116
  %123 = atomicrmw fadd float addrspace(1)* %121, float %122 syncscope("agent-one-as") monotonic, align 4
  %124 = getelementptr inbounds float, float addrspace(1)* %8, i64 %118
  %125 = getelementptr inbounds float, float addrspace(1)* %124, i64 %120
  %126 = atomicrmw fadd float addrspace(1)* %125, float %116 syncscope("agent-one-as") monotonic, align 4
  br label %127

127:                                              ; preds = %113, %109, %107
  br i1 %68, label %145, label %128

128:                                              ; preds = %127
  %129 = icmp sgt i32 %61, %4
  %130 = icmp slt i32 %61, 1
  %131 = or i1 %129, %130
  br i1 %131, label %145, label %132

132:                                              ; preds = %128
  %133 = fsub contract float 1.000000e+00, %59
  %134 = fmul contract float %53, %133
  %135 = mul nsw i32 %108, %6
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %9, i64 %136
  %138 = zext i32 %60 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %137, i64 %138
  %140 = fmul contract float %65, %134
  %141 = atomicrmw fadd float addrspace(1)* %139, float %140 syncscope("agent-one-as") monotonic, align 4
  %142 = getelementptr inbounds float, float addrspace(1)* %8, i64 %136
  %143 = getelementptr inbounds float, float addrspace(1)* %142, i64 %138
  %144 = atomicrmw fadd float addrspace(1)* %143, float %134 syncscope("agent-one-as") monotonic, align 4
  br label %145

145:                                              ; preds = %127, %128, %132, %10
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.trunc.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

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

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

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
