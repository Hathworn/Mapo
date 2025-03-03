; ModuleID = '../data/hip_kernels/16910/9/main.cu'
source_filename = "../data/hip_kernels/16910/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z4getUPKdS0_PdS1_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %6 = load double, double addrspace(1)* %5, align 8, !tbaa !4, !amdgpu.noclobber !8
  %7 = fptosi double %6 to i32
  %8 = getelementptr inbounds double, double addrspace(1)* %0, i64 9
  %9 = load double, double addrspace(1)* %8, align 8, !tbaa !4, !amdgpu.noclobber !8
  %10 = fptosi double %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !9
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = icmp slt i32 %11, %10
  br i1 %13, label %14, label %161

14:                                               ; preds = %4
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !4, !amdgpu.noclobber !8
  %18 = fptosi double %17 to i32
  %19 = icmp sgt i32 %7, 0
  %20 = mul i32 %15, %18
  %21 = add i32 %20, %12
  %22 = mul i32 %21, %7
  %23 = mul i32 %12, %10
  %24 = mul i32 %21, %10
  %25 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = getelementptr i8, i8 addrspace(4)* %25, i64 6
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 2, !range !10, !invariant.load !8
  %29 = zext i16 %28 to i32
  %30 = and i32 %7, 7
  %31 = icmp ult i32 %7, 8
  %32 = and i32 %7, -8
  %33 = icmp eq i32 %30, 0
  br label %34

34:                                               ; preds = %14, %154
  %35 = phi i32 [ %11, %14 ], [ %159, %154 ]
  br i1 %19, label %36, label %154

36:                                               ; preds = %34
  %37 = add i32 %35, %23
  %38 = mul i32 %37, %7
  br i1 %31, label %133, label %39

39:                                               ; preds = %36, %39
  %40 = phi double [ %129, %39 ], [ 0.000000e+00, %36 ]
  %41 = phi i32 [ %130, %39 ], [ 0, %36 ]
  %42 = phi i32 [ %131, %39 ], [ 0, %36 ]
  %43 = add i32 %41, %22
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %2, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !4
  %47 = add i32 %41, %38
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %1, i64 %48
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !4
  %51 = fmul contract double %46, %50
  %52 = fadd contract double %40, %51
  %53 = or i32 %41, 1
  %54 = add i32 %53, %22
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %2, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !4
  %58 = add i32 %53, %38
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %1, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !4
  %62 = fmul contract double %57, %61
  %63 = fadd contract double %52, %62
  %64 = or i32 %41, 2
  %65 = add i32 %64, %22
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds double, double addrspace(1)* %2, i64 %66
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !4
  %69 = add i32 %64, %38
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds double, double addrspace(1)* %1, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !4
  %73 = fmul contract double %68, %72
  %74 = fadd contract double %63, %73
  %75 = or i32 %41, 3
  %76 = add i32 %75, %22
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds double, double addrspace(1)* %2, i64 %77
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !4
  %80 = add i32 %75, %38
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds double, double addrspace(1)* %1, i64 %81
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !4
  %84 = fmul contract double %79, %83
  %85 = fadd contract double %74, %84
  %86 = or i32 %41, 4
  %87 = add i32 %86, %22
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds double, double addrspace(1)* %2, i64 %88
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !4
  %91 = add i32 %86, %38
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %1, i64 %92
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !4
  %95 = fmul contract double %90, %94
  %96 = fadd contract double %85, %95
  %97 = or i32 %41, 5
  %98 = add i32 %97, %22
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds double, double addrspace(1)* %2, i64 %99
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !4
  %102 = add i32 %97, %38
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds double, double addrspace(1)* %1, i64 %103
  %105 = load double, double addrspace(1)* %104, align 8, !tbaa !4
  %106 = fmul contract double %101, %105
  %107 = fadd contract double %96, %106
  %108 = or i32 %41, 6
  %109 = add i32 %108, %22
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds double, double addrspace(1)* %2, i64 %110
  %112 = load double, double addrspace(1)* %111, align 8, !tbaa !4
  %113 = add i32 %108, %38
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds double, double addrspace(1)* %1, i64 %114
  %116 = load double, double addrspace(1)* %115, align 8, !tbaa !4
  %117 = fmul contract double %112, %116
  %118 = fadd contract double %107, %117
  %119 = or i32 %41, 7
  %120 = add i32 %119, %22
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds double, double addrspace(1)* %2, i64 %121
  %123 = load double, double addrspace(1)* %122, align 8, !tbaa !4
  %124 = add i32 %119, %38
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds double, double addrspace(1)* %1, i64 %125
  %127 = load double, double addrspace(1)* %126, align 8, !tbaa !4
  %128 = fmul contract double %123, %127
  %129 = fadd contract double %118, %128
  %130 = add nuw nsw i32 %41, 8
  %131 = add i32 %42, 8
  %132 = icmp eq i32 %131, %32
  br i1 %132, label %133, label %39, !llvm.loop !11

133:                                              ; preds = %39, %36
  %134 = phi double [ undef, %36 ], [ %129, %39 ]
  %135 = phi double [ 0.000000e+00, %36 ], [ %129, %39 ]
  %136 = phi i32 [ 0, %36 ], [ %130, %39 ]
  br i1 %33, label %154, label %137

137:                                              ; preds = %133, %137
  %138 = phi double [ %150, %137 ], [ %135, %133 ]
  %139 = phi i32 [ %151, %137 ], [ %136, %133 ]
  %140 = phi i32 [ %152, %137 ], [ 0, %133 ]
  %141 = add i32 %139, %22
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds double, double addrspace(1)* %2, i64 %142
  %144 = load double, double addrspace(1)* %143, align 8, !tbaa !4
  %145 = add i32 %139, %38
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds double, double addrspace(1)* %1, i64 %146
  %148 = load double, double addrspace(1)* %147, align 8, !tbaa !4
  %149 = fmul contract double %144, %148
  %150 = fadd contract double %138, %149
  %151 = add nuw nsw i32 %139, 1
  %152 = add i32 %140, 1
  %153 = icmp eq i32 %152, %30
  br i1 %153, label %154, label %137, !llvm.loop !13

154:                                              ; preds = %133, %137, %34
  %155 = phi double [ 0.000000e+00, %34 ], [ %134, %133 ], [ %150, %137 ]
  %156 = add i32 %35, %24
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds double, double addrspace(1)* %3, i64 %157
  store double %155, double addrspace(1)* %158, align 8, !tbaa !4
  %159 = add i32 %35, %29
  %160 = icmp slt i32 %159, %10
  br i1 %160, label %34, label %161, !llvm.loop !15

161:                                              ; preds = %154, %4
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
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
