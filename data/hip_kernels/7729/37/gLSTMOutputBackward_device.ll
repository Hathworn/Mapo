; ModuleID = '../data/hip_kernels/7729/37/main.cu'
source_filename = "../data/hip_kernels/7729/37/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z19gLSTMOutputBackwardPfS_S_S_PKfS1_S1_S1_S1_mm(float addrspace(1)* %0, float addrspace(1)* %1, float addrspace(1)* %2, float addrspace(1)* %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, i64 %9, i64 %10) local_unnamed_addr #0 {
  %12 = icmp eq i64 %9, 0
  br i1 %12, label %35, label %13

13:                                               ; preds = %11
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = icmp eq i64 %10, 0
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %17 = trunc i64 %10 to i32
  %18 = mul i32 %17, 3
  %19 = icmp eq float addrspace(1)* %0, addrspacecast (float* null to float addrspace(1)*)
  %20 = icmp eq float addrspace(1)* %1, addrspacecast (float* null to float addrspace(1)*)
  %21 = icmp eq float addrspace(1)* %2, addrspacecast (float* null to float addrspace(1)*)
  %22 = icmp eq float addrspace(1)* %3, addrspacecast (float* null to float addrspace(1)*)
  %23 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %24 = getelementptr i8, i8 addrspace(4)* %23, i64 4
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 12
  %27 = bitcast i8 addrspace(4)* %26 to i32 addrspace(4)*
  %28 = load i32, i32 addrspace(4)* %27, align 4, !tbaa !4
  %29 = load i16, i16 addrspace(4)* %25, align 4, !range !13, !invariant.load !14
  %30 = zext i16 %29 to i32
  %31 = udiv i32 %28, %30
  %32 = mul i32 %31, %30
  %33 = icmp ugt i32 %28, %32
  %34 = zext i1 %33 to i32
  br label %36

35:                                               ; preds = %171, %11
  ret void

36:                                               ; preds = %13, %171
  %37 = phi i32 [ 0, %13 ], [ %173, %171 ]
  %38 = add i32 %37, %14
  %39 = sext i32 %38 to i64
  %40 = icmp ult i64 %39, %9
  br i1 %40, label %41, label %171

41:                                               ; preds = %36
  %42 = mul i64 %39, %10
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = shl i64 %42, 2
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = getelementptr inbounds float, float addrspace(1)* %2, i64 %44
  %47 = getelementptr inbounds float, float addrspace(1)* %4, i64 %42
  %48 = getelementptr inbounds float, float addrspace(1)* %5, i64 %44
  %49 = getelementptr inbounds float, float addrspace(1)* %6, i64 %44
  %50 = getelementptr inbounds float, float addrspace(1)* %8, i64 %42
  br i1 %15, label %171, label %51

51:                                               ; preds = %41, %167
  %52 = phi i32 [ %168, %167 ], [ 0, %41 ]
  %53 = add i32 %52, %16
  %54 = sext i32 %53 to i64
  %55 = icmp ult i64 %54, %10
  br i1 %55, label %56, label %167

56:                                               ; preds = %51
  %57 = add i32 %53, %18
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %48, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !15
  %61 = getelementptr inbounds float, float addrspace(1)* %49, i64 %58
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !15
  %63 = fadd contract float %60, %62
  %64 = getelementptr inbounds float, float addrspace(1)* %7, i64 %58
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !15
  %66 = fadd contract float %63, %65
  %67 = fcmp contract ult float %66, 0.000000e+00
  br i1 %67, label %85, label %68

68:                                               ; preds = %56
  %69 = fneg contract float %66
  %70 = fmul float %66, 0xBFF7154760000000
  %71 = tail call float @llvm.rint.f32(float %70)
  %72 = fcmp olt float %66, 0xC0562E4300000000
  %73 = fcmp ogt float %66, 0x4059D1DA00000000
  %74 = fneg float %70
  %75 = tail call float @llvm.fma.f32(float %69, float 0x3FF7154760000000, float %74)
  %76 = tail call float @llvm.fma.f32(float %69, float 0x3E54AE0BE0000000, float %75)
  %77 = fsub float %70, %71
  %78 = fadd float %76, %77
  %79 = tail call float @llvm.exp2.f32(float %78)
  %80 = fptosi float %71 to i32
  %81 = tail call float @llvm.amdgcn.ldexp.f32(float %79, i32 %80)
  %82 = select i1 %73, float 0.000000e+00, float %81
  %83 = select i1 %72, float 0x7FF0000000000000, float %82
  %84 = fpext float %83 to double
  br label %101

85:                                               ; preds = %56
  %86 = fmul float %66, 0x3FF7154760000000
  %87 = tail call float @llvm.rint.f32(float %86)
  %88 = fcmp ogt float %66, 0x40562E4300000000
  %89 = fcmp olt float %66, 0xC059D1DA00000000
  %90 = fneg float %86
  %91 = tail call float @llvm.fma.f32(float %66, float 0x3FF7154760000000, float %90)
  %92 = tail call float @llvm.fma.f32(float %66, float 0x3E54AE0BE0000000, float %91)
  %93 = fsub float %86, %87
  %94 = fadd float %92, %93
  %95 = tail call float @llvm.exp2.f32(float %94)
  %96 = fptosi float %87 to i32
  %97 = tail call float @llvm.amdgcn.ldexp.f32(float %95, i32 %96)
  %98 = select i1 %89, float 0.000000e+00, float %97
  %99 = select i1 %88, float 0x7FF0000000000000, float %98
  %100 = fpext float %99 to double
  br label %101

101:                                              ; preds = %68, %85
  %102 = phi double [ %100, %85 ], [ %84, %68 ]
  %103 = phi double [ %100, %85 ], [ 1.000000e+00, %68 ]
  %104 = fadd contract double %102, 1.000000e+00
  %105 = fdiv contract double %103, %104
  %106 = fptrunc double %105 to float
  %107 = getelementptr inbounds float, float addrspace(1)* %47, i64 %54
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !15
  %109 = tail call float @llvm.fabs.f32(float %108)
  %110 = fcmp olt float %109, 6.250000e-01
  br i1 %110, label %111, label %119

111:                                              ; preds = %101
  %112 = fmul float %108, %108
  %113 = tail call float @llvm.fmuladd.f32(float %112, float 0xBF7758E7A0000000, float 0x3F95211920000000)
  %114 = tail call float @llvm.fmuladd.f32(float %112, float %113, float 0xBFAB8389C0000000)
  %115 = tail call float @llvm.fmuladd.f32(float %112, float %114, float 0x3FC1107040000000)
  %116 = tail call float @llvm.fmuladd.f32(float %112, float %115, float 0xBFD5555320000000)
  %117 = fmul float %109, %116
  %118 = tail call float @llvm.fmuladd.f32(float %112, float %117, float %109)
  br label %136

119:                                              ; preds = %101
  %120 = fmul float %109, 2.000000e+00
  %121 = fmul float %120, 0x3FF7154760000000
  %122 = tail call float @llvm.rint.f32(float %121)
  %123 = fcmp ogt float %120, 0x40562E4300000000
  %124 = fneg float %121
  %125 = tail call float @llvm.fma.f32(float %120, float 0x3FF7154760000000, float %124)
  %126 = tail call float @llvm.fma.f32(float %120, float 0x3E54AE0BE0000000, float %125)
  %127 = fsub float %121, %122
  %128 = fadd float %126, %127
  %129 = tail call float @llvm.exp2.f32(float %128)
  %130 = fptosi float %122 to i32
  %131 = tail call float @llvm.amdgcn.ldexp.f32(float %129, i32 %130)
  %132 = fadd float %131, 1.000000e+00
  %133 = select i1 %123, float 0x7FF0000000000000, float %132
  %134 = tail call float @llvm.amdgcn.rcp.f32(float %133)
  %135 = tail call float @llvm.fmuladd.f32(float %134, float -2.000000e+00, float 1.000000e+00)
  br label %136

136:                                              ; preds = %111, %119
  %137 = phi float [ %118, %111 ], [ %135, %119 ]
  %138 = tail call float @llvm.copysign.f32(float %137, float %108)
  %139 = getelementptr inbounds float, float addrspace(1)* %50, i64 %54
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !15
  br i1 %19, label %149, label %141

141:                                              ; preds = %136
  %142 = fmul contract float %138, %138
  %143 = fsub contract float 1.000000e+00, %142
  %144 = fmul contract float %143, %106
  %145 = fmul contract float %140, %144
  %146 = getelementptr inbounds float, float addrspace(1)* %43, i64 %54
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !15
  %148 = fadd contract float %145, %147
  store float %148, float addrspace(1)* %146, align 4, !tbaa !15
  br label %149

149:                                              ; preds = %141, %136
  %150 = fmul contract float %138, %106
  %151 = fsub contract float 1.000000e+00, %106
  %152 = fmul contract float %151, %150
  %153 = fmul contract float %140, %152
  br i1 %20, label %158, label %154

154:                                              ; preds = %149
  %155 = getelementptr inbounds float, float addrspace(1)* %45, i64 %58
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !15
  %157 = fadd contract float %153, %156
  store float %157, float addrspace(1)* %155, align 4, !tbaa !15
  br label %158

158:                                              ; preds = %154, %149
  br i1 %21, label %163, label %159

159:                                              ; preds = %158
  %160 = getelementptr inbounds float, float addrspace(1)* %46, i64 %58
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !15
  %162 = fadd contract float %153, %161
  store float %162, float addrspace(1)* %160, align 4, !tbaa !15
  br label %163

163:                                              ; preds = %159, %158
  br i1 %22, label %167, label %164

164:                                              ; preds = %163
  %165 = getelementptr inbounds float, float addrspace(1)* %3, i64 %58
  %166 = atomicrmw fadd float addrspace(1)* %165, float %153 syncscope("agent-one-as") monotonic, align 4
  br label %167

167:                                              ; preds = %163, %164, %51
  %168 = add i32 %52, %30
  %169 = sext i32 %168 to i64
  %170 = icmp ult i64 %169, %10
  br i1 %170, label %51, label %171, !llvm.loop !19

171:                                              ; preds = %167, %41, %36
  %172 = add i32 %31, %37
  %173 = add i32 %172, %34
  %174 = sext i32 %173 to i64
  %175 = icmp ult i64 %174, %9
  br i1 %175, label %36, label %35, !llvm.loop !21
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
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = distinct !{!21, !20}
