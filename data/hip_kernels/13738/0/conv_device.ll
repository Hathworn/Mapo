; ModuleID = '../data/hip_kernels/13738/0/main.cu'
source_filename = "../data/hip_kernels/13738/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z4convPfS_S_iiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 2, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %11, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %26 = add i32 %24, %25
  %27 = sdiv i32 %6, -2
  %28 = add i32 %18, %27
  %29 = sdiv i32 %7, -2
  %30 = add i32 %26, %29
  %31 = icmp slt i32 %18, %3
  %32 = icmp slt i32 %26, %4
  %33 = select i1 %31, i1 %32, i1 false
  %34 = icmp sgt i32 %8, 0
  %35 = select i1 %33, i1 %34, i1 false
  br i1 %35, label %36, label %195

36:                                               ; preds = %9
  %37 = icmp sgt i32 %6, 0
  %38 = icmp sgt i32 %7, 0
  %39 = icmp sgt i32 %5, 0
  %40 = mul nsw i32 %18, %4
  %41 = add nsw i32 %40, %26
  %42 = mul nsw i32 %41, %8
  %43 = and i32 %5, 7
  %44 = icmp ult i32 %5, 8
  %45 = and i32 %5, -8
  %46 = icmp eq i32 %43, 0
  %47 = and i32 %5, 7
  %48 = icmp ult i32 %5, 8
  %49 = and i32 %5, -8
  %50 = icmp eq i32 %47, 0
  br label %51

51:                                               ; preds = %36, %63
  %52 = phi i32 [ 0, %36 ], [ %68, %63 ]
  br i1 %37, label %53, label %63

53:                                               ; preds = %51, %97
  %54 = phi i32 [ %99, %97 ], [ 0, %51 ]
  %55 = phi float [ %98, %97 ], [ 0.000000e+00, %51 ]
  br i1 %38, label %56, label %97

56:                                               ; preds = %53
  %57 = add nsw i32 %28, %54
  %58 = icmp slt i32 %57, 0
  %59 = icmp sge i32 %57, %3
  %60 = select i1 %58, i1 true, i1 %59
  %61 = mul nsw i32 %57, %4
  %62 = mul nsw i32 %54, %7
  br label %70

63:                                               ; preds = %97, %51
  %64 = phi float [ 0.000000e+00, %51 ], [ %98, %97 ]
  %65 = add nsw i32 %52, %42
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %2, i64 %66
  store float %64, float addrspace(1)* %67, align 4, !tbaa !7
  %68 = add nuw nsw i32 %52, 1
  %69 = icmp eq i32 %68, %8
  br i1 %69, label %195, label %51, !llvm.loop !11

70:                                               ; preds = %56, %125
  %71 = phi i32 [ 0, %56 ], [ %127, %125 ]
  %72 = phi float [ %55, %56 ], [ %126, %125 ]
  br i1 %39, label %73, label %125

73:                                               ; preds = %70
  %74 = add nsw i32 %30, %71
  %75 = icmp slt i32 %74, 0
  %76 = icmp sge i32 %74, %4
  %77 = add nsw i32 %74, %61
  %78 = mul nsw i32 %77, %5
  %79 = add nsw i32 %71, %62
  %80 = mul nsw i32 %79, %8
  %81 = add nsw i32 %80, %52
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %1, i64 %82
  %84 = select i1 %60, i1 true, i1 %75
  %85 = select i1 %84, i1 true, i1 %76
  br i1 %85, label %96, label %86

86:                                               ; preds = %73
  br i1 %44, label %106, label %87

87:                                               ; preds = %86
  %88 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %89 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %90 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %91 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %92 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %93 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %94 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %95 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  br label %133

96:                                               ; preds = %73
  br i1 %48, label %101, label %129

97:                                               ; preds = %125, %53
  %98 = phi float [ %55, %53 ], [ %126, %125 ]
  %99 = add nuw nsw i32 %54, 1
  %100 = icmp eq i32 %99, %6
  br i1 %100, label %63, label %53, !llvm.loop !13

101:                                              ; preds = %129, %96
  br i1 %50, label %125, label %102

102:                                              ; preds = %101, %102
  %103 = phi i32 [ %104, %102 ], [ 0, %101 ]
  %104 = add i32 %103, 1
  %105 = icmp eq i32 %104, %47
  br i1 %105, label %125, label %102, !llvm.loop !14

106:                                              ; preds = %133, %86
  %107 = phi float [ undef, %86 ], [ %191, %133 ]
  %108 = phi i32 [ 0, %86 ], [ %192, %133 ]
  %109 = phi float [ %72, %86 ], [ %191, %133 ]
  br i1 %46, label %125, label %110

110:                                              ; preds = %106
  %111 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  br label %112

112:                                              ; preds = %112, %110
  %113 = phi i32 [ %122, %112 ], [ %108, %110 ]
  %114 = phi float [ %121, %112 ], [ %109, %110 ]
  %115 = phi i32 [ %123, %112 ], [ 0, %110 ]
  %116 = add nsw i32 %113, %78
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7
  %120 = fmul contract float %119, %111
  %121 = fadd contract float %114, %120
  %122 = add nuw nsw i32 %113, 1
  %123 = add i32 %115, 1
  %124 = icmp eq i32 %123, %43
  br i1 %124, label %125, label %112, !llvm.loop !16

125:                                              ; preds = %102, %101, %112, %106, %70
  %126 = phi float [ %72, %70 ], [ %72, %102 ], [ %72, %101 ], [ %107, %106 ], [ %121, %112 ]
  %127 = add nuw nsw i32 %71, 1
  %128 = icmp eq i32 %127, %7
  br i1 %128, label %97, label %70, !llvm.loop !17

129:                                              ; preds = %96, %129
  %130 = phi i32 [ %131, %129 ], [ 0, %96 ]
  %131 = add i32 %130, 8
  %132 = icmp eq i32 %131, %49
  br i1 %132, label %101, label %129, !llvm.loop !18

133:                                              ; preds = %133, %87
  %134 = phi i32 [ 0, %87 ], [ %192, %133 ]
  %135 = phi float [ %72, %87 ], [ %191, %133 ]
  %136 = phi i32 [ 0, %87 ], [ %193, %133 ]
  %137 = add nsw i32 %134, %78
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %0, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7
  %141 = fmul contract float %140, %88
  %142 = fadd contract float %135, %141
  %143 = or i32 %134, 1
  %144 = add nsw i32 %143, %78
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7
  %148 = fmul contract float %147, %89
  %149 = fadd contract float %142, %148
  %150 = or i32 %134, 2
  %151 = add nsw i32 %150, %78
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %0, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !7
  %155 = fmul contract float %154, %90
  %156 = fadd contract float %149, %155
  %157 = or i32 %134, 3
  %158 = add nsw i32 %157, %78
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %0, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !7
  %162 = fmul contract float %161, %91
  %163 = fadd contract float %156, %162
  %164 = or i32 %134, 4
  %165 = add nsw i32 %164, %78
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %0, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !7
  %169 = fmul contract float %168, %92
  %170 = fadd contract float %163, %169
  %171 = or i32 %134, 5
  %172 = add nsw i32 %171, %78
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds float, float addrspace(1)* %0, i64 %173
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !7
  %176 = fmul contract float %175, %93
  %177 = fadd contract float %170, %176
  %178 = or i32 %134, 6
  %179 = add nsw i32 %178, %78
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %0, i64 %180
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !7
  %183 = fmul contract float %182, %94
  %184 = fadd contract float %177, %183
  %185 = or i32 %134, 7
  %186 = add nsw i32 %185, %78
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds float, float addrspace(1)* %0, i64 %187
  %189 = load float, float addrspace(1)* %188, align 4, !tbaa !7
  %190 = fmul contract float %189, %95
  %191 = fadd contract float %184, %190
  %192 = add nuw nsw i32 %134, 8
  %193 = add i32 %136, 8
  %194 = icmp eq i32 %193, %45
  br i1 %194, label %106, label %133, !llvm.loop !18

195:                                              ; preds = %63, %9
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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !15}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !12}
