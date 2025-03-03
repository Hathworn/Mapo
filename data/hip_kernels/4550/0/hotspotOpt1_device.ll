; ModuleID = '../data/hip_kernels/4550/0/main.cu'
source_filename = "../data/hip_kernels/4550/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11hotspotOpt1PfS_S_fiiifffffff(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, float %3, i32 %4, i32 %5, i32 %6, float %7, float %8, float %9, float %10, float %11, float %12, float %13) local_unnamed_addr #0 {
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %25 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 2, !range !4, !invariant.load !5
  %28 = zext i16 %27 to i32
  %29 = mul i32 %24, %28
  %30 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %31 = add i32 %29, %30
  %32 = mul nsw i32 %31, %4
  %33 = add nsw i32 %32, %23
  %34 = mul nsw i32 %5, %4
  %35 = icmp eq i32 %23, 0
  %36 = add nsw i32 %33, -1
  %37 = select i1 %35, i32 %32, i32 %36
  %38 = add nsw i32 %4, -1
  %39 = icmp ne i32 %23, %38
  %40 = zext i1 %39 to i32
  %41 = add nsw i32 %33, %40
  %42 = icmp eq i32 %31, 0
  %43 = select i1 %42, i32 0, i32 %4
  %44 = sub nsw i32 %33, %43
  %45 = add nsw i32 %5, -1
  %46 = icmp eq i32 %31, %45
  %47 = select i1 %46, i32 0, i32 %4
  %48 = add nsw i32 %33, %47
  %49 = sext i32 %33 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = add nsw i32 %33, %34
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = sext i32 %37 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = sext i32 %41 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = sext i32 %48 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %60 = sext i32 %44 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %63 = fmul contract float %11, 8.000000e+01
  %64 = getelementptr inbounds float, float addrspace(1)* %2, i64 %49
  %65 = add nsw i32 %48, %34
  %66 = add nsw i32 %44, %34
  %67 = add nsw i32 %41, %34
  %68 = add nsw i32 %37, %34
  %69 = icmp sgt i32 %6, 2
  %70 = add i32 %6, -2
  br label %72

71:                                               ; preds = %99
  ret void

72:                                               ; preds = %14, %99
  %73 = phi i32 [ 0, %14 ], [ %137, %99 ]
  %74 = load float, float addrspace(1)* %50, align 4, !tbaa !7
  %75 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %76 = fmul contract float %74, %13
  %77 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %78 = fmul contract float %77, %8
  %79 = fadd contract float %76, %78
  %80 = load float, float addrspace(1)* %57, align 4, !tbaa !7
  %81 = fmul contract float %80, %7
  %82 = fadd contract float %79, %81
  %83 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %84 = fmul contract float %83, %10
  %85 = fadd contract float %82, %84
  %86 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %87 = fmul contract float %86, %9
  %88 = fadd contract float %85, %87
  %89 = fmul contract float %74, %12
  %90 = fadd contract float %89, %88
  %91 = fmul contract float %75, %11
  %92 = fadd contract float %91, %90
  %93 = load float, float addrspace(1)* %62, align 4, !tbaa !7
  %94 = fmul contract float %93, %3
  %95 = fadd contract float %94, %92
  %96 = fadd contract float %63, %95
  store float %96, float addrspace(1)* %64, align 4, !tbaa !7
  br i1 %69, label %139, label %99

97:                                               ; preds = %139
  %98 = fmul contract float %145, %12
  br label %99

99:                                               ; preds = %97, %72
  %100 = phi float [ %175, %97 ], [ %91, %72 ]
  %101 = phi float [ %98, %97 ], [ %89, %72 ]
  %102 = phi i64 [ %149, %97 ], [ %52, %72 ]
  %103 = phi float [ %151, %97 ], [ %75, %72 ]
  %104 = phi i32 [ %185, %97 ], [ %65, %72 ]
  %105 = phi i32 [ %186, %97 ], [ %66, %72 ]
  %106 = phi i32 [ %187, %97 ], [ %67, %72 ]
  %107 = phi i32 [ %188, %97 ], [ %68, %72 ]
  %108 = fmul contract float %103, %13
  %109 = sext i32 %107 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %1, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7
  %112 = fmul contract float %111, %8
  %113 = fadd contract float %108, %112
  %114 = sext i32 %106 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  %117 = fmul contract float %116, %7
  %118 = fadd contract float %113, %117
  %119 = sext i32 %104 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7
  %122 = fmul contract float %121, %10
  %123 = fadd contract float %118, %122
  %124 = sext i32 %105 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7
  %127 = fmul contract float %126, %9
  %128 = fadd contract float %123, %127
  %129 = fadd contract float %101, %128
  %130 = fadd contract float %100, %129
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7
  %133 = fmul contract float %132, %3
  %134 = fadd contract float %133, %130
  %135 = fadd contract float %63, %134
  %136 = getelementptr inbounds float, float addrspace(1)* %2, i64 %102
  store float %135, float addrspace(1)* %136, align 4, !tbaa !7
  %137 = add nuw nsw i32 %73, 1
  %138 = icmp eq i32 %137, 100
  br i1 %138, label %71, label %72, !llvm.loop !11

139:                                              ; preds = %72, %139
  %140 = phi i32 [ %188, %139 ], [ %68, %72 ]
  %141 = phi i32 [ %187, %139 ], [ %67, %72 ]
  %142 = phi i32 [ %186, %139 ], [ %66, %72 ]
  %143 = phi i32 [ %185, %139 ], [ %65, %72 ]
  %144 = phi i32 [ %184, %139 ], [ 1, %72 ]
  %145 = phi float [ %151, %139 ], [ %75, %72 ]
  %146 = phi float [ %145, %139 ], [ %74, %72 ]
  %147 = phi i32 [ %148, %139 ], [ %51, %72 ]
  %148 = add nsw i32 %147, %34
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %1, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7
  %152 = fmul contract float %145, %13
  %153 = sext i32 %140 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %1, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7
  %156 = fmul contract float %155, %8
  %157 = fadd contract float %152, %156
  %158 = sext i32 %141 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %1, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !7
  %161 = fmul contract float %160, %7
  %162 = fadd contract float %157, %161
  %163 = sext i32 %143 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %1, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !7
  %166 = fmul contract float %165, %10
  %167 = fadd contract float %162, %166
  %168 = sext i32 %142 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %1, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !7
  %171 = fmul contract float %170, %9
  %172 = fadd contract float %167, %171
  %173 = fmul contract float %146, %12
  %174 = fadd contract float %173, %172
  %175 = fmul contract float %151, %11
  %176 = fadd contract float %175, %174
  %177 = sext i32 %147 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %0, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !7
  %180 = fmul contract float %179, %3
  %181 = fadd contract float %180, %176
  %182 = fadd contract float %63, %181
  %183 = getelementptr inbounds float, float addrspace(1)* %2, i64 %177
  store float %182, float addrspace(1)* %183, align 4, !tbaa !7
  %184 = add nuw nsw i32 %144, 1
  %185 = add nsw i32 %143, %34
  %186 = add nsw i32 %142, %34
  %187 = add nsw i32 %141, %34
  %188 = add nsw i32 %140, %34
  %189 = icmp eq i32 %144, %70
  br i1 %189, label %97, label %139, !llvm.loop !14
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
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.count", i32 1}
!14 = distinct !{!14, !12, !13}
