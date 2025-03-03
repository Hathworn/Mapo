; ModuleID = '../data/hip_kernels/15122/0/main.cu'
source_filename = "../data/hip_kernels/15122/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10testKernelPfS_S_jjjj(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %12 = shl i32 %8, 4
  %13 = shl i32 %9, 4
  %14 = add nsw i32 %13, %11
  %15 = add nsw i32 %12, %10
  %16 = icmp eq i32 %5, 0
  br i1 %16, label %33, label %17

17:                                               ; preds = %7
  %18 = icmp eq i32 %6, 0
  %19 = and i32 %6, 3
  %20 = icmp ult i32 %6, 4
  %21 = and i32 %6, -4
  %22 = icmp eq i32 %19, 0
  br label %23

23:                                               ; preds = %17, %68
  %24 = phi float [ 0.000000e+00, %17 ], [ %69, %68 ]
  %25 = phi i32 [ 0, %17 ], [ %70, %68 ]
  br i1 %18, label %68, label %26

26:                                               ; preds = %23
  %27 = mul i32 %25, %6
  %28 = sub nsw i32 %14, %25
  %29 = icmp sgt i32 %28, -1
  %30 = icmp ult i32 %28, %3
  %31 = select i1 %29, i1 %30, i1 false
  %32 = mul i32 %28, %4
  br i1 %20, label %39, label %72

33:                                               ; preds = %68, %7
  %34 = phi float [ 0.000000e+00, %7 ], [ %69, %68 ]
  %35 = mul i32 %14, %4
  %36 = add i32 %35, %15
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %2, i64 %37
  store float %34, float addrspace(1)* %38, align 4, !tbaa !5
  ret void

39:                                               ; preds = %149, %26
  %40 = phi float [ undef, %26 ], [ %150, %149 ]
  %41 = phi float [ %24, %26 ], [ %150, %149 ]
  %42 = phi i32 [ 0, %26 ], [ %151, %149 ]
  br i1 %22, label %68, label %43

43:                                               ; preds = %39, %63
  %44 = phi float [ %64, %63 ], [ %41, %39 ]
  %45 = phi i32 [ %65, %63 ], [ %42, %39 ]
  %46 = phi i32 [ %66, %63 ], [ 0, %39 ]
  %47 = add i32 %45, %27
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5, !amdgpu.noclobber !9
  br i1 %31, label %51, label %63

51:                                               ; preds = %43
  %52 = sub nsw i32 %15, %45
  %53 = icmp sgt i32 %52, -1
  %54 = icmp ult i32 %52, %4
  %55 = select i1 %53, i1 %54, i1 false
  br i1 %55, label %56, label %63

56:                                               ; preds = %51
  %57 = add i32 %52, %32
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = fmul contract float %50, %60
  %62 = fadd contract float %44, %61
  br label %63

63:                                               ; preds = %56, %51, %43
  %64 = phi float [ %62, %56 ], [ %44, %51 ], [ %44, %43 ]
  %65 = add nuw nsw i32 %45, 1
  %66 = add i32 %46, 1
  %67 = icmp eq i32 %66, %19
  br i1 %67, label %68, label %43, !llvm.loop !10

68:                                               ; preds = %39, %63, %23
  %69 = phi float [ %24, %23 ], [ %40, %39 ], [ %64, %63 ]
  %70 = add nuw nsw i32 %25, 1
  %71 = icmp eq i32 %70, %5
  br i1 %71, label %33, label %23, !llvm.loop !12

72:                                               ; preds = %26, %149
  %73 = phi float [ %150, %149 ], [ %24, %26 ]
  %74 = phi i32 [ %151, %149 ], [ 0, %26 ]
  %75 = phi i32 [ %152, %149 ], [ 0, %26 ]
  %76 = add i32 %74, %27
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !5, !amdgpu.noclobber !9
  br i1 %31, label %80, label %92

80:                                               ; preds = %72
  %81 = sub nsw i32 %15, %74
  %82 = icmp sgt i32 %81, -1
  %83 = icmp ult i32 %81, %4
  %84 = select i1 %82, i1 %83, i1 false
  br i1 %84, label %85, label %92

85:                                               ; preds = %80
  %86 = add i32 %81, %32
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !5, !amdgpu.noclobber !9
  %90 = fmul contract float %79, %89
  %91 = fadd contract float %73, %90
  br label %92

92:                                               ; preds = %85, %80, %72
  %93 = phi float [ %91, %85 ], [ %73, %80 ], [ %73, %72 ]
  %94 = or i32 %74, 1
  %95 = add i32 %94, %27
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %1, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !5, !amdgpu.noclobber !9
  br i1 %31, label %99, label %111

99:                                               ; preds = %92
  %100 = sub nsw i32 %15, %94
  %101 = icmp sgt i32 %100, -1
  %102 = icmp ult i32 %100, %4
  %103 = select i1 %101, i1 %102, i1 false
  br i1 %103, label %104, label %111

104:                                              ; preds = %99
  %105 = add i32 %100, %32
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !5, !amdgpu.noclobber !9
  %109 = fmul contract float %98, %108
  %110 = fadd contract float %93, %109
  br label %111

111:                                              ; preds = %104, %99, %92
  %112 = phi float [ %110, %104 ], [ %93, %99 ], [ %93, %92 ]
  %113 = or i32 %74, 2
  %114 = add i32 %113, %27
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !5, !amdgpu.noclobber !9
  br i1 %31, label %118, label %130

118:                                              ; preds = %111
  %119 = sub nsw i32 %15, %113
  %120 = icmp sgt i32 %119, -1
  %121 = icmp ult i32 %119, %4
  %122 = select i1 %120, i1 %121, i1 false
  br i1 %122, label %123, label %130

123:                                              ; preds = %118
  %124 = add i32 %119, %32
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !5, !amdgpu.noclobber !9
  %128 = fmul contract float %117, %127
  %129 = fadd contract float %112, %128
  br label %130

130:                                              ; preds = %123, %118, %111
  %131 = phi float [ %129, %123 ], [ %112, %118 ], [ %112, %111 ]
  %132 = or i32 %74, 3
  %133 = add i32 %132, %27
  %134 = zext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !5, !amdgpu.noclobber !9
  br i1 %31, label %137, label %149

137:                                              ; preds = %130
  %138 = sub nsw i32 %15, %132
  %139 = icmp sgt i32 %138, -1
  %140 = icmp ult i32 %138, %4
  %141 = select i1 %139, i1 %140, i1 false
  br i1 %141, label %142, label %149

142:                                              ; preds = %137
  %143 = add i32 %138, %32
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %0, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !5, !amdgpu.noclobber !9
  %147 = fmul contract float %136, %146
  %148 = fadd contract float %131, %147
  br label %149

149:                                              ; preds = %142, %137, %130
  %150 = phi float [ %148, %142 ], [ %131, %137 ], [ %131, %130 ]
  %151 = add nuw nsw i32 %74, 4
  %152 = add i32 %75, 4
  %153 = icmp eq i32 %152, %21
  br i1 %153, label %39, label %72, !llvm.loop !14
}

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
