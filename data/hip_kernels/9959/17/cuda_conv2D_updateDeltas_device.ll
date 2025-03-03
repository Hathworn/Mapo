; ModuleID = '../data/hip_kernels/9959/17/main.cu'
source_filename = "../data/hip_kernels/9959/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24cuda_conv2D_updateDeltasPdS_PKdS1_dmmmmmmmmmm(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13, i64 %14) local_unnamed_addr #0 {
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %16, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add i32 %22, %23
  %25 = sext i32 %24 to i64
  %26 = freeze i64 %25
  %27 = freeze i64 %9
  %28 = udiv i64 %26, %27
  %29 = mul i64 %28, %27
  %30 = sub i64 %26, %29
  %31 = shl i64 %28, 32
  %32 = ashr exact i64 %31, 32
  %33 = freeze i64 %32
  %34 = freeze i64 %8
  %35 = udiv i64 %33, %34
  %36 = mul i64 %35, %34
  %37 = sub i64 %33, %36
  %38 = shl i64 %35, 32
  %39 = ashr exact i64 %38, 32
  %40 = icmp ult i64 %39, %5
  br i1 %40, label %41, label %155

41:                                               ; preds = %15
  %42 = mul i64 %39, %8
  %43 = mul i64 %37, %14
  %44 = sub i64 %43, %13
  %45 = mul i64 %39, %10
  %46 = add i64 %42, %37
  %47 = mul i64 %46, %9
  %48 = add i64 %47, %30
  %49 = mul i64 %30, %14
  %50 = sub i64 %49, %13
  %51 = getelementptr inbounds double, double addrspace(1)* %3, i64 %48
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !7, !amdgpu.noclobber !5
  %53 = getelementptr inbounds double, double addrspace(1)* %1, i64 %39
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !7, !amdgpu.noclobber !5
  %55 = fadd contract double %52, %54
  store double %55, double addrspace(1)* %53, align 8, !tbaa !7
  %56 = icmp eq i64 %10, 0
  br i1 %56, label %155, label %57

57:                                               ; preds = %41
  %58 = icmp eq i64 %6, 0
  %59 = icmp eq i64 %7, 0
  %60 = trunc i64 %11 to i32
  %61 = and i64 %7, 1
  %62 = icmp eq i64 %7, 1
  %63 = and i64 %7, -2
  %64 = icmp eq i64 %61, 0
  br label %65

65:                                               ; preds = %57, %71
  %66 = phi i64 [ 0, %57 ], [ %72, %71 ]
  %67 = mul i64 %66, %11
  br i1 %58, label %71, label %68

68:                                               ; preds = %65
  %69 = add i64 %66, %45
  %70 = mul i64 %69, %6
  br label %74

71:                                               ; preds = %107, %65
  %72 = add nuw i64 %66, 1
  %73 = icmp eq i64 %72, %10
  br i1 %73, label %155, label %65, !llvm.loop !11

74:                                               ; preds = %68, %107
  %75 = phi i64 [ 0, %68 ], [ %108, %107 ]
  %76 = add i64 %75, %44
  %77 = trunc i64 %76 to i32
  br i1 %59, label %107, label %78

78:                                               ; preds = %74
  %79 = icmp sgt i32 %77, -1
  %80 = icmp slt i32 %77, %60
  %81 = and i64 %76, 4294967295
  %82 = add i64 %81, %67
  %83 = mul i64 %82, %12
  %84 = add i64 %75, %70
  %85 = mul i64 %84, %7
  br i1 %62, label %86, label %110

86:                                               ; preds = %151, %78
  %87 = phi i64 [ 0, %78 ], [ %152, %151 ]
  br i1 %64, label %107, label %88

88:                                               ; preds = %86
  %89 = add i64 %87, %50
  %90 = trunc i64 %89 to i32
  br i1 %79, label %91, label %107

91:                                               ; preds = %88
  %92 = icmp sgt i32 %90, -1
  %93 = select i1 %80, i1 %92, i1 false
  %94 = icmp slt i32 %90, %60
  %95 = select i1 %93, i1 %94, i1 false
  br i1 %95, label %96, label %107

96:                                               ; preds = %91
  %97 = and i64 %89, 4294967295
  %98 = add i64 %97, %83
  %99 = load double, double addrspace(1)* %51, align 8, !tbaa !7
  %100 = getelementptr inbounds double, double addrspace(1)* %2, i64 %98
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !7
  %102 = fmul contract double %99, %101
  %103 = add i64 %87, %85
  %104 = getelementptr inbounds double, double addrspace(1)* %0, i64 %103
  %105 = load double, double addrspace(1)* %104, align 8, !tbaa !7
  %106 = fadd contract double %105, %102
  store double %106, double addrspace(1)* %104, align 8, !tbaa !7
  br label %107

107:                                              ; preds = %86, %96, %91, %88, %74
  %108 = add nuw i64 %75, 1
  %109 = icmp eq i64 %108, %6
  br i1 %109, label %71, label %74, !llvm.loop !13

110:                                              ; preds = %78, %151
  %111 = phi i64 [ %152, %151 ], [ 0, %78 ]
  %112 = phi i64 [ %153, %151 ], [ 0, %78 ]
  %113 = add i64 %111, %50
  %114 = trunc i64 %113 to i32
  br i1 %79, label %115, label %131

115:                                              ; preds = %110
  %116 = icmp sgt i32 %114, -1
  %117 = select i1 %80, i1 %116, i1 false
  %118 = icmp slt i32 %114, %60
  %119 = select i1 %117, i1 %118, i1 false
  br i1 %119, label %120, label %131

120:                                              ; preds = %115
  %121 = and i64 %113, 4294967295
  %122 = add i64 %121, %83
  %123 = load double, double addrspace(1)* %51, align 8, !tbaa !7
  %124 = getelementptr inbounds double, double addrspace(1)* %2, i64 %122
  %125 = load double, double addrspace(1)* %124, align 8, !tbaa !7
  %126 = fmul contract double %123, %125
  %127 = add i64 %111, %85
  %128 = getelementptr inbounds double, double addrspace(1)* %0, i64 %127
  %129 = load double, double addrspace(1)* %128, align 8, !tbaa !7
  %130 = fadd contract double %129, %126
  store double %130, double addrspace(1)* %128, align 8, !tbaa !7
  br label %131

131:                                              ; preds = %120, %115, %110
  %132 = or i64 %111, 1
  %133 = add i64 %132, %50
  %134 = trunc i64 %133 to i32
  br i1 %79, label %135, label %151

135:                                              ; preds = %131
  %136 = icmp sgt i32 %134, -1
  %137 = select i1 %80, i1 %136, i1 false
  %138 = icmp slt i32 %134, %60
  %139 = select i1 %137, i1 %138, i1 false
  br i1 %139, label %140, label %151

140:                                              ; preds = %135
  %141 = and i64 %133, 4294967295
  %142 = add i64 %141, %83
  %143 = load double, double addrspace(1)* %51, align 8, !tbaa !7
  %144 = getelementptr inbounds double, double addrspace(1)* %2, i64 %142
  %145 = load double, double addrspace(1)* %144, align 8, !tbaa !7
  %146 = fmul contract double %143, %145
  %147 = add i64 %132, %85
  %148 = getelementptr inbounds double, double addrspace(1)* %0, i64 %147
  %149 = load double, double addrspace(1)* %148, align 8, !tbaa !7
  %150 = fadd contract double %149, %146
  store double %150, double addrspace(1)* %148, align 8, !tbaa !7
  br label %151

151:                                              ; preds = %140, %135, %131
  %152 = add nuw i64 %111, 2
  %153 = add i64 %112, 2
  %154 = icmp eq i64 %153, %63
  br i1 %154, label %86, label %110, !llvm.loop !14

155:                                              ; preds = %71, %41, %15
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
