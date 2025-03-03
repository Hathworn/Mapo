; ModuleID = '../data/hip_kernels/14393/1/main.cu'
source_filename = "../data/hip_kernels/14393/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16boxfilter_kerneliiPhS_ii(i32 %0, i32 %1, i8 addrspace(1)* nocapture readonly %2, i8 addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = sdiv i32 %5, 2
  %25 = icmp slt i32 %5, -1
  br i1 %25, label %38, label %26

26:                                               ; preds = %6
  %27 = sub nsw i32 0, %24
  %28 = sdiv i32 %4, 2
  %29 = sub nsw i32 0, %28
  %30 = icmp slt i32 %4, -1
  %31 = tail call i32 @llvm.abs.i32(i32 %28, i1 true)
  %32 = tail call i32 @llvm.abs.i32(i32 %24, i1 true)
  %33 = add i32 %28, %31
  %34 = add i32 %33, 1
  %35 = and i32 %34, 3
  %36 = icmp eq i32 %35, 0
  %37 = icmp ult i32 %33, 3
  br label %48

38:                                               ; preds = %88, %6
  %39 = phi i32 [ 0, %6 ], [ %89, %88 ]
  %40 = phi float [ 0.000000e+00, %6 ], [ %90, %88 ]
  %41 = sitofp i32 %39 to float
  %42 = fdiv contract float %40, %41
  %43 = fptoui float %42 to i8
  %44 = mul nsw i32 %23, %0
  %45 = add nsw i32 %44, %15
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %46
  store i8 %43, i8 addrspace(1)* %47, align 1, !tbaa !7
  ret void

48:                                               ; preds = %26, %88
  %49 = phi i32 [ %27, %26 ], [ %91, %88 ]
  %50 = phi float [ 0.000000e+00, %26 ], [ %90, %88 ]
  %51 = phi i32 [ 0, %26 ], [ %89, %88 ]
  br i1 %30, label %88, label %52

52:                                               ; preds = %48
  %53 = add nsw i32 %49, %23
  %54 = icmp sge i32 %53, %1
  %55 = icmp slt i32 %53, 0
  %56 = or i1 %54, %55
  %57 = mul nsw i32 %53, %0
  br i1 %36, label %82, label %58

58:                                               ; preds = %52, %76
  %59 = phi i32 [ %79, %76 ], [ %29, %52 ]
  %60 = phi float [ %78, %76 ], [ %50, %52 ]
  %61 = phi i32 [ %77, %76 ], [ %51, %52 ]
  %62 = phi i32 [ %80, %76 ], [ 0, %52 ]
  %63 = add nsw i32 %59, %15
  %64 = icmp sge i32 %63, %0
  %65 = icmp slt i32 %63, 0
  %66 = or i1 %64, %65
  %67 = select i1 %66, i1 true, i1 %56
  br i1 %67, label %76, label %68

68:                                               ; preds = %58
  %69 = add nsw i32 %63, %57
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %70
  %72 = load i8, i8 addrspace(1)* %71, align 1, !tbaa !7, !amdgpu.noclobber !5
  %73 = uitofp i8 %72 to float
  %74 = fadd contract float %60, %73
  %75 = add nsw i32 %61, 1
  br label %76

76:                                               ; preds = %68, %58
  %77 = phi i32 [ %75, %68 ], [ %61, %58 ]
  %78 = phi float [ %74, %68 ], [ %60, %58 ]
  %79 = add i32 %59, 1
  %80 = add i32 %62, 1
  %81 = icmp eq i32 %80, %35
  br i1 %81, label %82, label %58, !llvm.loop !10

82:                                               ; preds = %76, %52
  %83 = phi i32 [ undef, %52 ], [ %77, %76 ]
  %84 = phi float [ undef, %52 ], [ %78, %76 ]
  %85 = phi i32 [ %29, %52 ], [ %79, %76 ]
  %86 = phi float [ %50, %52 ], [ %78, %76 ]
  %87 = phi i32 [ %51, %52 ], [ %77, %76 ]
  br i1 %37, label %88, label %93

88:                                               ; preds = %82, %161, %48
  %89 = phi i32 [ %51, %48 ], [ %83, %82 ], [ %162, %161 ]
  %90 = phi float [ %50, %48 ], [ %84, %82 ], [ %163, %161 ]
  %91 = add i32 %49, 1
  %92 = icmp eq i32 %49, %32
  br i1 %92, label %38, label %48, !llvm.loop !12

93:                                               ; preds = %82, %161
  %94 = phi i32 [ %164, %161 ], [ %85, %82 ]
  %95 = phi float [ %163, %161 ], [ %86, %82 ]
  %96 = phi i32 [ %162, %161 ], [ %87, %82 ]
  %97 = add nsw i32 %94, %15
  %98 = icmp sge i32 %97, %0
  %99 = icmp slt i32 %97, 0
  %100 = or i1 %98, %99
  %101 = select i1 %100, i1 true, i1 %56
  br i1 %101, label %110, label %102

102:                                              ; preds = %93
  %103 = add nsw i32 %97, %57
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %104
  %106 = load i8, i8 addrspace(1)* %105, align 1, !tbaa !7, !amdgpu.noclobber !5
  %107 = uitofp i8 %106 to float
  %108 = fadd contract float %95, %107
  %109 = add nsw i32 %96, 1
  br label %110

110:                                              ; preds = %93, %102
  %111 = phi i32 [ %109, %102 ], [ %96, %93 ]
  %112 = phi float [ %108, %102 ], [ %95, %93 ]
  %113 = add i32 %94, 1
  %114 = add nsw i32 %113, %15
  %115 = icmp sge i32 %114, %0
  %116 = icmp slt i32 %114, 0
  %117 = or i1 %115, %116
  %118 = select i1 %117, i1 true, i1 %56
  br i1 %118, label %127, label %119

119:                                              ; preds = %110
  %120 = add nsw i32 %114, %57
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %121
  %123 = load i8, i8 addrspace(1)* %122, align 1, !tbaa !7, !amdgpu.noclobber !5
  %124 = uitofp i8 %123 to float
  %125 = fadd contract float %112, %124
  %126 = add nsw i32 %111, 1
  br label %127

127:                                              ; preds = %119, %110
  %128 = phi i32 [ %126, %119 ], [ %111, %110 ]
  %129 = phi float [ %125, %119 ], [ %112, %110 ]
  %130 = add i32 %94, 2
  %131 = add nsw i32 %130, %15
  %132 = icmp sge i32 %131, %0
  %133 = icmp slt i32 %131, 0
  %134 = or i1 %132, %133
  %135 = select i1 %134, i1 true, i1 %56
  br i1 %135, label %144, label %136

136:                                              ; preds = %127
  %137 = add nsw i32 %131, %57
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %138
  %140 = load i8, i8 addrspace(1)* %139, align 1, !tbaa !7, !amdgpu.noclobber !5
  %141 = uitofp i8 %140 to float
  %142 = fadd contract float %129, %141
  %143 = add nsw i32 %128, 1
  br label %144

144:                                              ; preds = %136, %127
  %145 = phi i32 [ %143, %136 ], [ %128, %127 ]
  %146 = phi float [ %142, %136 ], [ %129, %127 ]
  %147 = add i32 %94, 3
  %148 = add nsw i32 %147, %15
  %149 = icmp sge i32 %148, %0
  %150 = icmp slt i32 %148, 0
  %151 = or i1 %149, %150
  %152 = select i1 %151, i1 true, i1 %56
  br i1 %152, label %161, label %153

153:                                              ; preds = %144
  %154 = add nsw i32 %148, %57
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %155
  %157 = load i8, i8 addrspace(1)* %156, align 1, !tbaa !7, !amdgpu.noclobber !5
  %158 = uitofp i8 %157 to float
  %159 = fadd contract float %146, %158
  %160 = add nsw i32 %145, 1
  br label %161

161:                                              ; preds = %153, %144
  %162 = phi i32 [ %160, %153 ], [ %145, %144 ]
  %163 = phi float [ %159, %153 ], [ %146, %144 ]
  %164 = add i32 %94, 4
  %165 = icmp eq i32 %147, %31
  br i1 %165, label %88, label %93, !llvm.loop !14
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
