; ModuleID = '../data/hip_kernels/988/0/main.cu'
source_filename = "../data/hip_kernels/988/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11compute_gpuPfS_S_iiiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = add i32 %18, %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %28 = add i32 %26, %27
  %29 = icmp sgt i32 %7, 0
  br i1 %29, label %30, label %43

30:                                               ; preds = %11
  %31 = mul nsw i32 %10, %9
  %32 = mul nsw i32 %6, %5
  %33 = icmp slt i32 %28, %9
  %34 = icmp slt i32 %20, %10
  %35 = select i1 %33, i1 %34, i1 false
  %36 = mul nsw i32 %28, %10
  %37 = add i32 %36, %20
  %38 = icmp sgt i32 %8, 0
  %39 = and i32 %8, 7
  %40 = icmp ult i32 %8, 8
  %41 = and i32 %8, -8
  %42 = icmp eq i32 %39, 0
  br label %44

43:                                               ; preds = %190, %11
  ret void

44:                                               ; preds = %30, %190
  %45 = phi i32 [ 0, %30 ], [ %191, %190 ]
  %46 = phi i32 [ 0, %30 ], [ %49, %190 ]
  %47 = phi i32 [ 0, %30 ], [ %48, %190 ]
  %48 = add nsw i32 %47, %31
  %49 = add nsw i32 %46, %32
  br i1 %35, label %50, label %190

50:                                               ; preds = %44
  %51 = add i32 %37, %48
  br i1 %38, label %52, label %190

52:                                               ; preds = %50
  %53 = mul nsw i32 %51, %8
  %54 = add i32 %49, %20
  %55 = sext i32 %51 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %2, i64 %55
  br label %57

57:                                               ; preds = %52, %85
  %58 = phi i32 [ 0, %52 ], [ %86, %85 ]
  %59 = add i32 %58, %53
  %60 = mul i32 %59, %8
  %61 = add i32 %58, %28
  %62 = mul i32 %61, %6
  %63 = load float, float addrspace(1)* %56, align 4, !tbaa !7
  br i1 %40, label %64, label %88

64:                                               ; preds = %88, %57
  %65 = phi float [ %63, %57 ], [ %186, %88 ]
  %66 = phi i32 [ 0, %57 ], [ %187, %88 ]
  br i1 %42, label %85, label %67

67:                                               ; preds = %64, %67
  %68 = phi float [ %81, %67 ], [ %65, %64 ]
  %69 = phi i32 [ %82, %67 ], [ %66, %64 ]
  %70 = phi i32 [ %83, %67 ], [ 0, %64 ]
  %71 = add i32 %54, %69
  %72 = add i32 %71, %62
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7
  %76 = add nsw i32 %69, %60
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = fmul contract float %75, %79
  %81 = fadd contract float %68, %80
  store float %81, float addrspace(1)* %56, align 4, !tbaa !7
  %82 = add nuw nsw i32 %69, 1
  %83 = add i32 %70, 1
  %84 = icmp eq i32 %83, %39
  br i1 %84, label %85, label %67, !llvm.loop !11

85:                                               ; preds = %67, %64
  %86 = add nuw nsw i32 %58, 1
  %87 = icmp eq i32 %86, %8
  br i1 %87, label %190, label %57, !llvm.loop !13

88:                                               ; preds = %57, %88
  %89 = phi float [ %186, %88 ], [ %63, %57 ]
  %90 = phi i32 [ %187, %88 ], [ 0, %57 ]
  %91 = phi i32 [ %188, %88 ], [ 0, %57 ]
  %92 = add i32 %54, %90
  %93 = add i32 %92, %62
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %97 = add nsw i32 %90, %60
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7
  %101 = fmul contract float %96, %100
  %102 = fadd contract float %89, %101
  store float %102, float addrspace(1)* %56, align 4, !tbaa !7
  %103 = or i32 %90, 1
  %104 = add i32 %54, %103
  %105 = add i32 %104, %62
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7
  %109 = add nsw i32 %103, %60
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %1, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  %113 = fmul contract float %108, %112
  %114 = fadd contract float %102, %113
  store float %114, float addrspace(1)* %56, align 4, !tbaa !7
  %115 = or i32 %90, 2
  %116 = add i32 %54, %115
  %117 = add i32 %116, %62
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7
  %121 = add nsw i32 %115, %60
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %1, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7
  %125 = fmul contract float %120, %124
  %126 = fadd contract float %114, %125
  store float %126, float addrspace(1)* %56, align 4, !tbaa !7
  %127 = or i32 %90, 3
  %128 = add i32 %54, %127
  %129 = add i32 %128, %62
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7
  %133 = add nsw i32 %127, %60
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7
  %137 = fmul contract float %132, %136
  %138 = fadd contract float %126, %137
  store float %138, float addrspace(1)* %56, align 4, !tbaa !7
  %139 = or i32 %90, 4
  %140 = add i32 %54, %139
  %141 = add i32 %140, %62
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %0, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7
  %145 = add nsw i32 %139, %60
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %1, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !7
  %149 = fmul contract float %144, %148
  %150 = fadd contract float %138, %149
  store float %150, float addrspace(1)* %56, align 4, !tbaa !7
  %151 = or i32 %90, 5
  %152 = add i32 %54, %151
  %153 = add i32 %152, %62
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %0, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7
  %157 = add nsw i32 %151, %60
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %1, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !7
  %161 = fmul contract float %156, %160
  %162 = fadd contract float %150, %161
  store float %162, float addrspace(1)* %56, align 4, !tbaa !7
  %163 = or i32 %90, 6
  %164 = add i32 %54, %163
  %165 = add i32 %164, %62
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %0, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !7
  %169 = add nsw i32 %163, %60
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %1, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !7
  %173 = fmul contract float %168, %172
  %174 = fadd contract float %162, %173
  store float %174, float addrspace(1)* %56, align 4, !tbaa !7
  %175 = or i32 %90, 7
  %176 = add i32 %54, %175
  %177 = add i32 %176, %62
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %0, i64 %178
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !7
  %181 = add nsw i32 %175, %60
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %1, i64 %182
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !7
  %185 = fmul contract float %180, %184
  %186 = fadd contract float %174, %185
  store float %186, float addrspace(1)* %56, align 4, !tbaa !7
  %187 = add nuw nsw i32 %90, 8
  %188 = add i32 %91, 8
  %189 = icmp eq i32 %188, %41
  br i1 %189, label %64, label %88, !llvm.loop !15

190:                                              ; preds = %85, %50, %44
  %191 = add nuw nsw i32 %45, 1
  %192 = icmp eq i32 %191, %7
  br i1 %192, label %43, label %44, !llvm.loop !16
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !14}
