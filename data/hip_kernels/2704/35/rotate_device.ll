; ModuleID = '../data/hip_kernels/2704/35/main.cu'
source_filename = "../data/hip_kernels/2704/35/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z6rotatePffS_mmmmmmmmm(float addrspace(1)* nocapture readonly %0, float %1, float addrspace(1)* nocapture writeonly %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !4
  %18 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !13, !invariant.load !14
  %21 = zext i16 %20 to i32
  %22 = udiv i32 %17, %21
  %23 = mul i32 %22, %21
  %24 = icmp ugt i32 %17, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %13
  %28 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %29 = add i32 %27, %28
  %30 = mul i32 %29, %21
  %31 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %32 = add i32 %30, %31
  %33 = zext i32 %32 to i64
  %34 = mul i32 %26, %21
  %35 = zext i32 %34 to i64
  %36 = mul i64 %10, %9
  %37 = mul i64 %36, %11
  %38 = mul i64 %4, %3
  %39 = mul i64 %38, %5
  %40 = udiv i64 %39, %37
  %41 = udiv i64 %39, %35
  %42 = mul i64 %41, %33
  %43 = freeze i64 %42
  %44 = freeze i64 %40
  %45 = udiv i64 %43, %44
  %46 = mul i64 %45, %44
  %47 = sub i64 %43, %46
  %48 = urem i64 %45, %9
  %49 = mul i64 %40, %9
  %50 = udiv i64 %42, %49
  %51 = urem i64 %50, %10
  %52 = mul i64 %49, %10
  %53 = udiv i64 %42, %52
  %54 = urem i64 %53, %11
  %55 = add i64 %40, -1
  %56 = add i64 %41, -1
  br label %57

57:                                               ; preds = %12, %173
  %58 = phi float [ undef, %12 ], [ %179, %173 ]
  %59 = phi float [ undef, %12 ], [ %178, %173 ]
  %60 = phi i64 [ 0, %12 ], [ %177, %173 ]
  %61 = phi i64 [ %54, %12 ], [ %180, %173 ]
  %62 = phi i64 [ %51, %12 ], [ 0, %173 ]
  %63 = phi i64 [ %48, %12 ], [ %176, %173 ]
  %64 = phi i64 [ %47, %12 ], [ %175, %173 ]
  %65 = phi i64 [ %42, %12 ], [ %174, %173 ]
  %66 = icmp ult i64 %62, %10
  br i1 %66, label %67, label %173

67:                                               ; preds = %57, %170
  %68 = phi float [ %81, %170 ], [ %58, %57 ]
  %69 = phi float [ %80, %170 ], [ %59, %57 ]
  %70 = phi i64 [ %79, %170 ], [ %60, %57 ]
  %71 = phi i64 [ %171, %170 ], [ %62, %57 ]
  %72 = phi i64 [ 0, %170 ], [ %63, %57 ]
  %73 = phi i64 [ %77, %170 ], [ %64, %57 ]
  %74 = phi i64 [ %76, %170 ], [ %65, %57 ]
  br label %75

75:                                               ; preds = %67, %145
  %76 = phi i64 [ %146, %145 ], [ %74, %67 ]
  %77 = phi i64 [ 0, %145 ], [ %73, %67 ]
  %78 = phi i64 [ %153, %145 ], [ %72, %67 ]
  %79 = phi i64 [ %168, %145 ], [ %70, %67 ]
  %80 = phi float [ %151, %145 ], [ %69, %67 ]
  %81 = phi float [ %152, %145 ], [ %68, %67 ]
  %82 = icmp ult i64 %78, %9
  br i1 %82, label %83, label %170

83:                                               ; preds = %75
  %84 = mul i64 %77, %6
  %85 = add i64 %78, %84
  %86 = urem i64 %85, %3
  %87 = mul i64 %77, %7
  %88 = add i64 %87, %71
  %89 = urem i64 %88, %4
  %90 = mul i64 %77, %8
  %91 = add i64 %90, %61
  %92 = urem i64 %91, %5
  %93 = icmp ult i64 %79, %41
  br i1 %93, label %94, label %101

94:                                               ; preds = %83
  %95 = mul i64 %89, %3
  %96 = add i64 %95, %86
  %97 = mul i64 %92, %38
  %98 = add i64 %96, %97
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %101

101:                                              ; preds = %94, %83
  %102 = phi float [ %100, %94 ], [ %80, %83 ]
  %103 = icmp ult i64 %77, %55
  br i1 %103, label %104, label %145

104:                                              ; preds = %101, %140
  %105 = phi float [ %133, %140 ], [ %81, %101 ]
  %106 = phi float [ %143, %140 ], [ %102, %101 ]
  %107 = phi i64 [ %138, %140 ], [ %79, %101 ]
  %108 = phi i64 [ %123, %140 ], [ %92, %101 ]
  %109 = phi i64 [ %121, %140 ], [ %89, %101 ]
  %110 = phi i64 [ %119, %140 ], [ %86, %101 ]
  %111 = phi i64 [ %141, %140 ], [ %77, %101 ]
  %112 = phi i64 [ %117, %140 ], [ %76, %101 ]
  %113 = icmp ule i64 %107, %56
  %114 = icmp ult i64 %112, %39
  %115 = select i1 %113, i1 %114, i1 false
  br i1 %115, label %116, label %182

116:                                              ; preds = %104
  %117 = add nuw i64 %112, 1
  %118 = add i64 %110, %6
  %119 = urem i64 %118, %3
  %120 = add i64 %109, %7
  %121 = urem i64 %120, %4
  %122 = add i64 %108, %8
  %123 = urem i64 %122, %5
  %124 = mul i64 %121, %3
  %125 = add i64 %124, %119
  %126 = mul i64 %123, %38
  %127 = add i64 %125, %126
  %128 = icmp ult i64 %107, %56
  br i1 %128, label %129, label %132

129:                                              ; preds = %116
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %132

132:                                              ; preds = %129, %116
  %133 = phi float [ %131, %129 ], [ %105, %116 ]
  %134 = fpext float %106 to double
  %135 = fadd contract double %134, 1.000000e-01
  %136 = fptrunc double %135 to float
  %137 = getelementptr inbounds float, float addrspace(1)* %2, i64 %127
  store float %136, float addrspace(1)* %137, align 4, !tbaa !16
  %138 = add i64 %107, 1
  %139 = icmp ugt i64 %138, %56
  br i1 %139, label %182, label %140

140:                                              ; preds = %132
  %141 = add nuw i64 %111, 1
  %142 = icmp ult i64 %138, %41
  %143 = select i1 %142, float %133, float %106
  %144 = icmp ult i64 %141, %55
  br i1 %144, label %104, label %145, !llvm.loop !20

145:                                              ; preds = %140, %101
  %146 = phi i64 [ %76, %101 ], [ %117, %140 ]
  %147 = phi i64 [ %86, %101 ], [ %119, %140 ]
  %148 = phi i64 [ %89, %101 ], [ %121, %140 ]
  %149 = phi i64 [ %92, %101 ], [ %123, %140 ]
  %150 = phi i64 [ %79, %101 ], [ %138, %140 ]
  %151 = phi float [ %102, %101 ], [ %143, %140 ]
  %152 = phi float [ %81, %101 ], [ %133, %140 ]
  %153 = add i64 %78, 1
  %154 = add i64 %147, %6
  %155 = urem i64 %154, %3
  %156 = add i64 %148, %7
  %157 = urem i64 %156, %4
  %158 = add i64 %149, %8
  %159 = urem i64 %158, %5
  %160 = mul i64 %157, %3
  %161 = add i64 %160, %155
  %162 = mul i64 %159, %38
  %163 = add i64 %161, %162
  %164 = fpext float %151 to double
  %165 = fadd contract double %164, 1.000000e-01
  %166 = fptrunc double %165 to float
  %167 = getelementptr inbounds float, float addrspace(1)* %2, i64 %163
  store float %166, float addrspace(1)* %167, align 4, !tbaa !16
  %168 = add i64 %150, 1
  %169 = icmp ugt i64 %168, %56
  br i1 %169, label %182, label %75, !llvm.loop !22

170:                                              ; preds = %75
  %171 = add nuw i64 %71, 1
  %172 = icmp ult i64 %171, %10
  br i1 %172, label %67, label %173, !llvm.loop !23

173:                                              ; preds = %170, %57
  %174 = phi i64 [ %65, %57 ], [ %76, %170 ]
  %175 = phi i64 [ %64, %57 ], [ %77, %170 ]
  %176 = phi i64 [ %63, %57 ], [ 0, %170 ]
  %177 = phi i64 [ %60, %57 ], [ %79, %170 ]
  %178 = phi float [ %59, %57 ], [ %80, %170 ]
  %179 = phi float [ %58, %57 ], [ %81, %170 ]
  %180 = add i64 %61, 1
  %181 = icmp ult i64 %180, %11
  br i1 %181, label %57, label %182, !llvm.loop !24

182:                                              ; preds = %173, %145, %132, %104
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !21}
