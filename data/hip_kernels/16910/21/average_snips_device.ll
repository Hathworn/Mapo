; ModuleID = '../data/hip_kernels/16910/21/main.cu'
source_filename = "../data/hip_kernels/16910/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13average_snipsPKdPKiS2_PKfS4_S2_S4_S4_S4_PdPiS4_S4_(double addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, double addrspace(1)* nocapture %9, i32 addrspace(1)* nocapture %10, float addrspace(1)* nocapture readnone %11, float addrspace(1)* nocapture readnone %12) local_unnamed_addr #0 {
  %14 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %15 = fptosi double %14 to i32
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !4, !amdgpu.noclobber !8
  %18 = fptosi double %17 to i32
  %19 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %20 = load double, double addrspace(1)* %19, align 8, !tbaa !4, !amdgpu.noclobber !8
  %21 = fptosi double %20 to i32
  %22 = getelementptr inbounds double, double addrspace(1)* %0, i64 6
  %23 = load double, double addrspace(1)* %22, align 8, !tbaa !4, !amdgpu.noclobber !8
  %24 = fptosi double %23 to i32
  %25 = getelementptr inbounds double, double addrspace(1)* %0, i64 9
  %26 = load double, double addrspace(1)* %25, align 8, !tbaa !4, !amdgpu.noclobber !8
  %27 = fptosi double %26 to i32
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %29 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %30 = getelementptr inbounds double, double addrspace(1)* %0, i64 15
  %31 = load double, double addrspace(1)* %30, align 8, !tbaa !4, !amdgpu.noclobber !8
  %32 = fptrunc double %31 to float
  %33 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !10
  %34 = icmp sgt i32 %33, 0
  br i1 %34, label %35, label %198

35:                                               ; preds = %13
  %36 = icmp eq i32 %28, 0
  %37 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %38 = icmp eq i32 %37, 0
  %39 = select i1 %36, i1 %38, i1 false
  %40 = sext i32 %29 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %40
  %42 = icmp slt i32 %37, %27
  %43 = icmp sgt i32 %24, 0
  %44 = mul i32 %29, %27
  %45 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %46 = getelementptr i8, i8 addrspace(4)* %45, i64 6
  %47 = bitcast i8 addrspace(4)* %46 to i16 addrspace(4)*
  %48 = and i32 %24, 3
  %49 = icmp ult i32 %24, 4
  %50 = and i32 %24, -4
  %51 = icmp eq i32 %48, 0
  br label %52

52:                                               ; preds = %35, %194
  %53 = phi i32 [ 0, %35 ], [ %195, %194 ]
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %3, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !12, !amdgpu.noclobber !8
  %57 = fcmp contract ogt float %56, %32
  br i1 %57, label %58, label %194

58:                                               ; preds = %52
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %54
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !10
  %61 = icmp eq i32 %60, %29
  br i1 %61, label %62, label %194

62:                                               ; preds = %58
  br i1 %39, label %63, label %66

63:                                               ; preds = %62
  %64 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !10
  %65 = add nsw i32 %64, 1
  store i32 %65, i32 addrspace(1)* %41, align 4, !tbaa !10
  br label %66

66:                                               ; preds = %63, %62
  br i1 %42, label %67, label %194

67:                                               ; preds = %66
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %54
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !10
  %70 = getelementptr inbounds float, float addrspace(1)* %4, i64 %54
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !12, !amdgpu.noclobber !8
  %72 = fpext float %71 to double
  %73 = load i16, i16 addrspace(4)* %47, align 2, !range !14, !invariant.load !8
  %74 = zext i16 %73 to i32
  br label %75

75:                                               ; preds = %67, %174
  %76 = phi i32 [ %37, %67 ], [ %192, %174 ]
  br i1 %43, label %77, label %174

77:                                               ; preds = %75
  br i1 %49, label %148, label %78

78:                                               ; preds = %77, %78
  %79 = phi double [ %144, %78 ], [ 0.000000e+00, %77 ]
  %80 = phi i32 [ %145, %78 ], [ 0, %77 ]
  %81 = phi i32 [ %146, %78 ], [ 0, %77 ]
  %82 = mul i32 %80, %18
  %83 = add i32 %82, %29
  %84 = mul i32 %83, %21
  %85 = add i32 %84, %28
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %7, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !12, !amdgpu.noclobber !8
  %89 = mul i32 %83, %27
  %90 = add i32 %76, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %8, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !12, !amdgpu.noclobber !8
  %94 = fmul contract float %88, %93
  %95 = fpext float %94 to double
  %96 = fadd contract double %79, %95
  %97 = or i32 %80, 1
  %98 = mul i32 %97, %18
  %99 = add i32 %98, %29
  %100 = mul i32 %99, %21
  %101 = add i32 %100, %28
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %7, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !12, !amdgpu.noclobber !8
  %105 = mul i32 %99, %27
  %106 = add i32 %76, %105
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %8, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !12, !amdgpu.noclobber !8
  %110 = fmul contract float %104, %109
  %111 = fpext float %110 to double
  %112 = fadd contract double %96, %111
  %113 = or i32 %80, 2
  %114 = mul i32 %113, %18
  %115 = add i32 %114, %29
  %116 = mul i32 %115, %21
  %117 = add i32 %116, %28
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %7, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !12, !amdgpu.noclobber !8
  %121 = mul i32 %115, %27
  %122 = add i32 %76, %121
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %8, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !12, !amdgpu.noclobber !8
  %126 = fmul contract float %120, %125
  %127 = fpext float %126 to double
  %128 = fadd contract double %112, %127
  %129 = or i32 %80, 3
  %130 = mul i32 %129, %18
  %131 = add i32 %130, %29
  %132 = mul i32 %131, %21
  %133 = add i32 %132, %28
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %7, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !12, !amdgpu.noclobber !8
  %137 = mul i32 %131, %27
  %138 = add i32 %76, %137
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %8, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !12, !amdgpu.noclobber !8
  %142 = fmul contract float %136, %141
  %143 = fpext float %142 to double
  %144 = fadd contract double %128, %143
  %145 = add nuw nsw i32 %80, 4
  %146 = add i32 %81, 4
  %147 = icmp eq i32 %146, %50
  br i1 %147, label %148, label %78, !llvm.loop !15

148:                                              ; preds = %78, %77
  %149 = phi double [ undef, %77 ], [ %144, %78 ]
  %150 = phi double [ 0.000000e+00, %77 ], [ %144, %78 ]
  %151 = phi i32 [ 0, %77 ], [ %145, %78 ]
  br i1 %51, label %174, label %152

152:                                              ; preds = %148, %152
  %153 = phi double [ %170, %152 ], [ %150, %148 ]
  %154 = phi i32 [ %171, %152 ], [ %151, %148 ]
  %155 = phi i32 [ %172, %152 ], [ 0, %148 ]
  %156 = mul i32 %154, %18
  %157 = add i32 %156, %29
  %158 = mul i32 %157, %21
  %159 = add i32 %158, %28
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %7, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !12, !amdgpu.noclobber !8
  %163 = mul i32 %157, %27
  %164 = add i32 %76, %163
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %8, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !12, !amdgpu.noclobber !8
  %168 = fmul contract float %162, %167
  %169 = fpext float %168 to double
  %170 = fadd contract double %153, %169
  %171 = add nuw nsw i32 %154, 1
  %172 = add i32 %155, 1
  %173 = icmp eq i32 %172, %48
  br i1 %173, label %174, label %152, !llvm.loop !17

174:                                              ; preds = %148, %152, %75
  %175 = phi double [ 0.000000e+00, %75 ], [ %149, %148 ], [ %170, %152 ]
  %176 = mul nsw i32 %76, %15
  %177 = add i32 %176, %28
  %178 = add i32 %177, %69
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %6, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !12, !amdgpu.noclobber !8
  %182 = fpext float %181 to double
  %183 = fmul contract double %175, %72
  %184 = fadd contract double %183, %182
  %185 = add i32 %76, %44
  %186 = mul i32 %185, %21
  %187 = add i32 %186, %28
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds double, double addrspace(1)* %9, i64 %188
  %190 = load double, double addrspace(1)* %189, align 8, !tbaa !4
  %191 = fadd contract double %190, %184
  store double %191, double addrspace(1)* %189, align 8, !tbaa !4
  %192 = add i32 %76, %74
  %193 = icmp slt i32 %192, %27
  br i1 %193, label %75, label %194, !llvm.loop !19

194:                                              ; preds = %174, %66, %52, %58
  %195 = add nuw nsw i32 %53, 1
  %196 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !10
  %197 = icmp slt i32 %195, %196
  br i1 %197, label %52, label %198, !llvm.loop !20

198:                                              ; preds = %194, %13
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !6, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !6, i64 0}
!14 = !{i16 1, i16 1025}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = distinct !{!19, !16}
!20 = distinct !{!20, !16}
