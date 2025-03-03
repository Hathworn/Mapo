; ModuleID = '../data/hip_kernels/1574/43/main.cu'
source_filename = "../data/hip_kernels/1574/43/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11computeCostPKdPKfS2_S2_PKbPKiS6_Pf(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i8 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %10 = fptosi double %9 to i32
  %11 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %12 = load double, double addrspace(1)* %11, align 8, !tbaa !4, !amdgpu.noclobber !8
  %13 = fptosi double %12 to i32
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !9, !invariant.load !8
  %18 = zext i16 %17 to i32
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = getelementptr inbounds double, double addrspace(1)* %0, i64 5
  %21 = load double, double addrspace(1)* %20, align 8, !tbaa !4, !amdgpu.noclobber !8
  %22 = fptrunc double %21 to float
  %23 = getelementptr inbounds double, double addrspace(1)* %0, i64 6
  %24 = load double, double addrspace(1)* %23, align 8, !tbaa !4, !amdgpu.noclobber !8
  %25 = fptosi double %24 to i32
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !10
  %27 = icmp slt i32 %26, %10
  br i1 %27, label %28, label %205

28:                                               ; preds = %8
  %29 = getelementptr inbounds double, double addrspace(1)* %0, i64 7
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !4, !amdgpu.noclobber !8
  %31 = fptosi double %30 to i32
  %32 = mul i32 %19, %31
  %33 = icmp sgt i32 %25, 0
  %34 = icmp sgt i32 %13, 0
  %35 = sext i32 %19 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %2, i64 %35
  %37 = mul nsw i32 %19, %10
  %38 = and i32 %13, 7
  %39 = icmp ult i32 %13, 8
  %40 = and i32 %13, -8
  %41 = icmp eq i32 %38, 0
  br label %42

42:                                               ; preds = %28, %202
  %43 = phi i32 [ %26, %28 ], [ %203, %202 ]
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !11, !amdgpu.noclobber !8
  %47 = add nsw i32 %46, %32
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %48
  %50 = load i8, i8 addrspace(1)* %49, align 1, !tbaa !13, !range !15, !amdgpu.noclobber !8
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %202, label %52

52:                                               ; preds = %42
  br i1 %33, label %53, label %187

53:                                               ; preds = %52
  %54 = mul nsw i32 %46, %25
  %55 = mul i32 %43, %25
  br label %56

56:                                               ; preds = %53, %183
  %57 = phi float [ 0.000000e+00, %53 ], [ %184, %183 ]
  %58 = phi i32 [ 0, %53 ], [ %185, %183 ]
  br i1 %34, label %59, label %183

59:                                               ; preds = %56
  %60 = add nsw i32 %58, %54
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !11, !amdgpu.noclobber !8
  %64 = add i32 %58, %55
  %65 = mul i32 %64, %13
  %66 = add i32 %63, %32
  %67 = mul i32 %66, %13
  br i1 %39, label %162, label %68

68:                                               ; preds = %59, %68
  %69 = phi i32 [ %159, %68 ], [ 0, %59 ]
  %70 = phi float [ %158, %68 ], [ %57, %59 ]
  %71 = phi i32 [ %160, %68 ], [ 0, %59 ]
  %72 = add i32 %69, %65
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !16
  %76 = add i32 %67, %69
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %3, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !16
  %80 = fmul contract float %75, %79
  %81 = fadd contract float %70, %80
  %82 = or i32 %69, 1
  %83 = add i32 %82, %65
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !16
  %87 = add i32 %67, %82
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %3, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16
  %91 = fmul contract float %86, %90
  %92 = fadd contract float %81, %91
  %93 = or i32 %69, 2
  %94 = add i32 %93, %65
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !16
  %98 = add i32 %67, %93
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %3, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !16
  %102 = fmul contract float %97, %101
  %103 = fadd contract float %92, %102
  %104 = or i32 %69, 3
  %105 = add i32 %104, %65
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !16
  %109 = add i32 %67, %104
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %3, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !16
  %113 = fmul contract float %108, %112
  %114 = fadd contract float %103, %113
  %115 = or i32 %69, 4
  %116 = add i32 %115, %65
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %1, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !16
  %120 = add i32 %67, %115
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %3, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !16
  %124 = fmul contract float %119, %123
  %125 = fadd contract float %114, %124
  %126 = or i32 %69, 5
  %127 = add i32 %126, %65
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %1, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !16
  %131 = add i32 %67, %126
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %3, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !16
  %135 = fmul contract float %130, %134
  %136 = fadd contract float %125, %135
  %137 = or i32 %69, 6
  %138 = add i32 %137, %65
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %1, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !16
  %142 = add i32 %67, %137
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %3, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !16
  %146 = fmul contract float %141, %145
  %147 = fadd contract float %136, %146
  %148 = or i32 %69, 7
  %149 = add i32 %148, %65
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %1, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !16
  %153 = add i32 %67, %148
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %3, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !16
  %157 = fmul contract float %152, %156
  %158 = fadd contract float %147, %157
  %159 = add nuw nsw i32 %69, 8
  %160 = add i32 %71, 8
  %161 = icmp eq i32 %160, %40
  br i1 %161, label %162, label %68, !llvm.loop !18

162:                                              ; preds = %68, %59
  %163 = phi float [ undef, %59 ], [ %158, %68 ]
  %164 = phi i32 [ 0, %59 ], [ %159, %68 ]
  %165 = phi float [ %57, %59 ], [ %158, %68 ]
  br i1 %41, label %183, label %166

166:                                              ; preds = %162, %166
  %167 = phi i32 [ %180, %166 ], [ %164, %162 ]
  %168 = phi float [ %179, %166 ], [ %165, %162 ]
  %169 = phi i32 [ %181, %166 ], [ 0, %162 ]
  %170 = add i32 %167, %65
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %1, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !16
  %174 = add i32 %67, %167
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %3, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !16
  %178 = fmul contract float %173, %177
  %179 = fadd contract float %168, %178
  %180 = add nuw nsw i32 %167, 1
  %181 = add i32 %169, 1
  %182 = icmp eq i32 %181, %38
  br i1 %182, label %183, label %166, !llvm.loop !20

183:                                              ; preds = %162, %166, %56
  %184 = phi float [ %57, %56 ], [ %163, %162 ], [ %179, %166 ]
  %185 = add nuw nsw i32 %58, 1
  %186 = icmp eq i32 %185, %25
  br i1 %186, label %187, label %56, !llvm.loop !22

187:                                              ; preds = %183, %52
  %188 = phi float [ 0.000000e+00, %52 ], [ %184, %183 ]
  %189 = tail call float @llvm.maxnum.f32(float %188, float 0.000000e+00)
  %190 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %191 = fdiv contract float %22, %190
  %192 = fadd contract float %189, %191
  %193 = fmul contract float %192, %192
  %194 = fmul contract float %190, %190
  %195 = fdiv contract float %22, %194
  %196 = fadd contract float %195, 1.000000e+00
  %197 = fdiv contract float %193, %196
  %198 = fsub contract float %197, %22
  %199 = add nsw i32 %43, %37
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds float, float addrspace(1)* %7, i64 %200
  store float %198, float addrspace(1)* %201, align 4, !tbaa !16
  br label %202

202:                                              ; preds = %187, %42
  %203 = add nuw nsw i32 %43, %18
  %204 = icmp slt i32 %203, %10
  br i1 %204, label %42, label %205, !llvm.loop !23

205:                                              ; preds = %202, %8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i16 1, i16 1025}
!10 = !{i32 0, i32 1024}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !6, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"bool", !6, i64 0}
!15 = !{i8 0, i8 2}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !6, i64 0}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.mustprogress"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !19}
!23 = distinct !{!23, !19}
