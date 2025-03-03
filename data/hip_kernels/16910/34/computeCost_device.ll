; ModuleID = '../data/hip_kernels/16910/34/main.cu'
source_filename = "../data/hip_kernels/16910/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11computeCostPKdPKfS2_S2_S2_PKbPKiS6_Pf(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i8 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %11 = fptosi double %10 to i32
  %12 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %13 = load double, double addrspace(1)* %12, align 8, !tbaa !4, !amdgpu.noclobber !8
  %14 = fptosi double %13 to i32
  %15 = getelementptr inbounds double, double addrspace(1)* %0, i64 6
  %16 = load double, double addrspace(1)* %15, align 8, !tbaa !4, !amdgpu.noclobber !8
  %17 = fptosi double %16 to i32
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !9, !invariant.load !8
  %22 = zext i16 %21 to i32
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !10
  %25 = icmp slt i32 %24, %11
  br i1 %25, label %26, label %203

26:                                               ; preds = %9
  %27 = getelementptr inbounds double, double addrspace(1)* %0, i64 7
  %28 = load double, double addrspace(1)* %27, align 8, !tbaa !4, !amdgpu.noclobber !8
  %29 = fptosi double %28 to i32
  %30 = mul i32 %23, %29
  %31 = icmp sgt i32 %17, 0
  %32 = icmp sgt i32 %14, 0
  %33 = sext i32 %23 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %4, i64 %33
  %35 = mul nsw i32 %23, %11
  %36 = and i32 %14, 7
  %37 = icmp ult i32 %14, 8
  %38 = and i32 %14, -8
  %39 = icmp eq i32 %36, 0
  br label %40

40:                                               ; preds = %26, %200
  %41 = phi i32 [ %24, %26 ], [ %201, %200 ]
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !11, !amdgpu.noclobber !8
  %45 = add nsw i32 %44, %30
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %46
  %48 = load i8, i8 addrspace(1)* %47, align 1, !tbaa !13, !range !15, !amdgpu.noclobber !8
  %49 = icmp eq i8 %48, 0
  br i1 %49, label %200, label %50

50:                                               ; preds = %40
  br i1 %31, label %51, label %185

51:                                               ; preds = %50
  %52 = mul nsw i32 %44, %17
  %53 = mul i32 %41, %17
  br label %54

54:                                               ; preds = %51, %181
  %55 = phi float [ 0.000000e+00, %51 ], [ %182, %181 ]
  %56 = phi i32 [ 0, %51 ], [ %183, %181 ]
  br i1 %32, label %57, label %181

57:                                               ; preds = %54
  %58 = add nsw i32 %56, %52
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !11, !amdgpu.noclobber !8
  %62 = add i32 %56, %53
  %63 = mul i32 %62, %14
  %64 = add i32 %61, %30
  %65 = mul i32 %64, %14
  br i1 %37, label %160, label %66

66:                                               ; preds = %57, %66
  %67 = phi i32 [ %157, %66 ], [ 0, %57 ]
  %68 = phi float [ %156, %66 ], [ %55, %57 ]
  %69 = phi i32 [ %158, %66 ], [ 0, %57 ]
  %70 = add i32 %67, %63
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !16
  %74 = add i32 %67, %65
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %3, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !16
  %78 = fmul contract float %73, %77
  %79 = fadd contract float %68, %78
  %80 = or i32 %67, 1
  %81 = add i32 %80, %63
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %1, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !16
  %85 = add i32 %80, %65
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %3, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16
  %89 = fmul contract float %84, %88
  %90 = fadd contract float %79, %89
  %91 = or i32 %67, 2
  %92 = add i32 %91, %63
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !16
  %96 = add i32 %91, %65
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %3, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !16
  %100 = fmul contract float %95, %99
  %101 = fadd contract float %90, %100
  %102 = or i32 %67, 3
  %103 = add i32 %102, %63
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !16
  %107 = add i32 %102, %65
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %3, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !16
  %111 = fmul contract float %106, %110
  %112 = fadd contract float %101, %111
  %113 = or i32 %67, 4
  %114 = add i32 %113, %63
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !16
  %118 = add i32 %113, %65
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %3, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !16
  %122 = fmul contract float %117, %121
  %123 = fadd contract float %112, %122
  %124 = or i32 %67, 5
  %125 = add i32 %124, %63
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !16
  %129 = add i32 %124, %65
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %3, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !16
  %133 = fmul contract float %128, %132
  %134 = fadd contract float %123, %133
  %135 = or i32 %67, 6
  %136 = add i32 %135, %63
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !16
  %140 = add i32 %135, %65
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %3, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !16
  %144 = fmul contract float %139, %143
  %145 = fadd contract float %134, %144
  %146 = or i32 %67, 7
  %147 = add i32 %146, %63
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %1, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !16
  %151 = add i32 %146, %65
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %3, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !16
  %155 = fmul contract float %150, %154
  %156 = fadd contract float %145, %155
  %157 = add nuw nsw i32 %67, 8
  %158 = add i32 %69, 8
  %159 = icmp eq i32 %158, %38
  br i1 %159, label %160, label %66, !llvm.loop !18

160:                                              ; preds = %66, %57
  %161 = phi float [ undef, %57 ], [ %156, %66 ]
  %162 = phi i32 [ 0, %57 ], [ %157, %66 ]
  %163 = phi float [ %55, %57 ], [ %156, %66 ]
  br i1 %39, label %181, label %164

164:                                              ; preds = %160, %164
  %165 = phi i32 [ %178, %164 ], [ %162, %160 ]
  %166 = phi float [ %177, %164 ], [ %163, %160 ]
  %167 = phi i32 [ %179, %164 ], [ 0, %160 ]
  %168 = add i32 %165, %63
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %1, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !16
  %172 = add i32 %165, %65
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds float, float addrspace(1)* %3, i64 %173
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !16
  %176 = fmul contract float %171, %175
  %177 = fadd contract float %166, %176
  %178 = add nuw nsw i32 %165, 1
  %179 = add i32 %167, 1
  %180 = icmp eq i32 %179, %36
  br i1 %180, label %181, label %164, !llvm.loop !20

181:                                              ; preds = %160, %164, %54
  %182 = phi float [ %55, %54 ], [ %161, %160 ], [ %177, %164 ]
  %183 = add nuw nsw i32 %56, 1
  %184 = icmp eq i32 %183, %17
  br i1 %184, label %185, label %54, !llvm.loop !22

185:                                              ; preds = %181, %50
  %186 = phi float [ 0.000000e+00, %50 ], [ %182, %181 ]
  %187 = load float, float addrspace(1)* %34, align 4, !tbaa !16
  %188 = fmul contract float %187, %187
  %189 = getelementptr inbounds float, float addrspace(1)* %2, i64 %42
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !16
  %191 = fmul contract float %190, %190
  %192 = fadd contract float %188, %191
  %193 = fmul contract float %190, 2.000000e+00
  %194 = fmul contract float %187, %193
  %195 = fmul contract float %186, %194
  %196 = fsub contract float %192, %195
  %197 = add nsw i32 %41, %35
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %8, i64 %198
  store float %196, float addrspace(1)* %199, align 4, !tbaa !16
  br label %200

200:                                              ; preds = %185, %40
  %201 = add nuw nsw i32 %41, %22
  %202 = icmp slt i32 %201, %11
  br i1 %202, label %40, label %203, !llvm.loop !23

203:                                              ; preds = %200, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
