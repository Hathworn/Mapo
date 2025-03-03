; ModuleID = '../data/hip_kernels/4156/21/main.cu'
source_filename = "../data/hip_kernels/4156/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11transform2dPff(float addrspace(1)* nocapture %0, float %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = shl i32 %5, 5
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = add i32 %6, %7
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !5
  %13 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !14, !invariant.load !15
  %16 = zext i16 %15 to i32
  %17 = udiv i32 %12, %16
  %18 = mul i32 %17, %16
  %19 = icmp ugt i32 %12, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %8, %21
  %23 = add i32 %22, %3
  %24 = shl i32 %23, 5
  %25 = add i32 %24, %4
  %26 = mul nsw i32 %25, 3
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !16
  %30 = add nsw i32 %26, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = add nsw i32 %26, 2
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !16
  %37 = fmul contract float %29, %1
  %38 = fcmp contract ogt float %37, 0.000000e+00
  br i1 %38, label %39, label %63

39:                                               ; preds = %2
  %40 = load float, float addrspace(1)* %32, align 4, !tbaa !16
  %41 = fpext float %40 to double
  %42 = fpext float %37 to double
  %43 = fmul contract double %42, 1.100000e+00
  %44 = fcmp contract ogt double %43, %41
  br i1 %44, label %45, label %63

45:                                               ; preds = %39
  %46 = fneg contract float %37
  %47 = fpext float %46 to double
  %48 = fmul contract double %47, 1.100000e+00
  %49 = fcmp contract olt double %48, %41
  br i1 %49, label %50, label %63

50:                                               ; preds = %45
  %51 = fpext float %36 to double
  %52 = fcmp contract ogt double %43, %51
  %53 = fcmp contract olt double %48, %51
  %54 = select i1 %52, i1 %53, i1 false
  br i1 %54, label %55, label %63

55:                                               ; preds = %50
  %56 = fadd contract double %42, 1.000000e-05
  %57 = fdiv contract double %41, %56
  %58 = fptrunc double %57 to float
  store float %58, float addrspace(1)* %32, align 4, !tbaa !16
  %59 = fneg contract float %36
  %60 = fpext float %59 to double
  %61 = fdiv contract double %60, %56
  %62 = fptrunc double %61 to float
  br label %64

63:                                               ; preds = %50, %45, %39, %2
  store float -1.000000e+00, float addrspace(1)* %32, align 4, !tbaa !16
  br label %64

64:                                               ; preds = %63, %55
  %65 = phi float [ -1.000000e+00, %63 ], [ %62, %55 ]
  store float %65, float addrspace(1)* %35, align 4, !tbaa !16
  %66 = add nsw i32 %8, 8
  %67 = mul i32 %66, %21
  %68 = add i32 %67, %3
  %69 = shl i32 %68, 5
  %70 = add i32 %69, %4
  %71 = mul nsw i32 %70, 3
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !16
  %75 = add nsw i32 %71, 1
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = add nsw i32 %71, 2
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !16
  %82 = fmul contract float %74, %1
  %83 = fcmp contract ogt float %82, 0.000000e+00
  br i1 %83, label %84, label %100

84:                                               ; preds = %64
  %85 = load float, float addrspace(1)* %77, align 4, !tbaa !16
  %86 = fpext float %85 to double
  %87 = fpext float %82 to double
  %88 = fmul contract double %87, 1.100000e+00
  %89 = fcmp contract ogt double %88, %86
  br i1 %89, label %90, label %100

90:                                               ; preds = %84
  %91 = fneg contract float %82
  %92 = fpext float %91 to double
  %93 = fmul contract double %92, 1.100000e+00
  %94 = fcmp contract olt double %93, %86
  br i1 %94, label %95, label %100

95:                                               ; preds = %90
  %96 = fpext float %81 to double
  %97 = fcmp contract ogt double %88, %96
  %98 = fcmp contract olt double %93, %96
  %99 = select i1 %97, i1 %98, i1 false
  br i1 %99, label %101, label %100

100:                                              ; preds = %95, %90, %84, %64
  store float -1.000000e+00, float addrspace(1)* %77, align 4, !tbaa !16
  br label %109

101:                                              ; preds = %95
  %102 = fadd contract double %87, 1.000000e-05
  %103 = fdiv contract double %86, %102
  %104 = fptrunc double %103 to float
  store float %104, float addrspace(1)* %77, align 4, !tbaa !16
  %105 = fneg contract float %81
  %106 = fpext float %105 to double
  %107 = fdiv contract double %106, %102
  %108 = fptrunc double %107 to float
  br label %109

109:                                              ; preds = %101, %100
  %110 = phi float [ -1.000000e+00, %100 ], [ %108, %101 ]
  store float %110, float addrspace(1)* %80, align 4, !tbaa !16
  %111 = add nsw i32 %8, 16
  %112 = mul i32 %111, %21
  %113 = add i32 %112, %3
  %114 = shl i32 %113, 5
  %115 = add i32 %114, %4
  %116 = mul nsw i32 %115, 3
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !16
  %120 = add nsw i32 %116, 1
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %123 = add nsw i32 %116, 2
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !16
  %127 = fmul contract float %119, %1
  %128 = fcmp contract ogt float %127, 0.000000e+00
  br i1 %128, label %129, label %145

129:                                              ; preds = %109
  %130 = load float, float addrspace(1)* %122, align 4, !tbaa !16
  %131 = fpext float %130 to double
  %132 = fpext float %127 to double
  %133 = fmul contract double %132, 1.100000e+00
  %134 = fcmp contract ogt double %133, %131
  br i1 %134, label %135, label %145

135:                                              ; preds = %129
  %136 = fneg contract float %127
  %137 = fpext float %136 to double
  %138 = fmul contract double %137, 1.100000e+00
  %139 = fcmp contract olt double %138, %131
  br i1 %139, label %140, label %145

140:                                              ; preds = %135
  %141 = fpext float %126 to double
  %142 = fcmp contract ogt double %133, %141
  %143 = fcmp contract olt double %138, %141
  %144 = select i1 %142, i1 %143, i1 false
  br i1 %144, label %146, label %145

145:                                              ; preds = %140, %135, %129, %109
  store float -1.000000e+00, float addrspace(1)* %122, align 4, !tbaa !16
  br label %154

146:                                              ; preds = %140
  %147 = fadd contract double %132, 1.000000e-05
  %148 = fdiv contract double %131, %147
  %149 = fptrunc double %148 to float
  store float %149, float addrspace(1)* %122, align 4, !tbaa !16
  %150 = fneg contract float %126
  %151 = fpext float %150 to double
  %152 = fdiv contract double %151, %147
  %153 = fptrunc double %152 to float
  br label %154

154:                                              ; preds = %146, %145
  %155 = phi float [ -1.000000e+00, %145 ], [ %153, %146 ]
  store float %155, float addrspace(1)* %125, align 4, !tbaa !16
  %156 = add nsw i32 %8, 24
  %157 = mul i32 %156, %21
  %158 = add i32 %157, %3
  %159 = shl i32 %158, 5
  %160 = add i32 %159, %4
  %161 = mul nsw i32 %160, 3
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %0, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !16
  %165 = add nsw i32 %161, 1
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %0, i64 %166
  %168 = add nsw i32 %161, 2
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %0, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !16
  %172 = fmul contract float %164, %1
  %173 = fcmp contract ogt float %172, 0.000000e+00
  br i1 %173, label %174, label %190

174:                                              ; preds = %154
  %175 = load float, float addrspace(1)* %167, align 4, !tbaa !16
  %176 = fpext float %175 to double
  %177 = fpext float %172 to double
  %178 = fmul contract double %177, 1.100000e+00
  %179 = fcmp contract ogt double %178, %176
  br i1 %179, label %180, label %190

180:                                              ; preds = %174
  %181 = fneg contract float %172
  %182 = fpext float %181 to double
  %183 = fmul contract double %182, 1.100000e+00
  %184 = fcmp contract olt double %183, %176
  br i1 %184, label %185, label %190

185:                                              ; preds = %180
  %186 = fpext float %171 to double
  %187 = fcmp contract ogt double %178, %186
  %188 = fcmp contract olt double %183, %186
  %189 = select i1 %187, i1 %188, i1 false
  br i1 %189, label %191, label %190

190:                                              ; preds = %185, %180, %174, %154
  store float -1.000000e+00, float addrspace(1)* %167, align 4, !tbaa !16
  br label %199

191:                                              ; preds = %185
  %192 = fadd contract double %177, 1.000000e-05
  %193 = fdiv contract double %176, %192
  %194 = fptrunc double %193 to float
  store float %194, float addrspace(1)* %167, align 4, !tbaa !16
  %195 = fneg contract float %171
  %196 = fpext float %195 to double
  %197 = fdiv contract double %196, %192
  %198 = fptrunc double %197 to float
  br label %199

199:                                              ; preds = %191, %190
  %200 = phi float [ -1.000000e+00, %190 ], [ %198, %191 ]
  store float %200, float addrspace(1)* %170, align 4, !tbaa !16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
